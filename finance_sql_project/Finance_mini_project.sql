-- Finance_Mini_Project.sql
-- Consolidated SQL workbook for Finance + Retail mini-project
-- Author: Hitesh Garg
-- Date: (add date)
-- Notes: Replace table names if your DB uses different names.

-- ============================================================
-- SECTION A — Quick sanity / validation checks
-- ============================================================

/*  A1. Totals sanity check: compare aggregated fields to computed totals */
SELECT
  ROUND(SUM(Net_Sales),2) AS total_net_sales,
  ROUND(SUM(COGS),2)        AS total_cogs,
  ROUND(SUM(Gross_Profit),2)AS total_gross_profit,
  ROUND(SUM(Net_Sales) - SUM(COGS),2) AS expected_gross_profit,
  CASE WHEN ROUND(SUM(Gross_Profit),2) = ROUND(SUM(Net_Sales) - SUM(COGS),2) THEN 1 ELSE 0 END AS profit_matches_expected
FROM Sales;

-- ============================================================
-- SECTION B — Top-level aggregates & common analysis
-- ============================================================

/* B1. Top 10 products by total revenue */
SELECT Product,
       ROUND(SUM(Net_Sales),2) AS total_revenue,
       ROUND(SUM(Net_Profit),2) AS total_profit,
       SUM(Units_Sold) AS units_sold
FROM Sales
GROUP BY Product
ORDER BY total_revenue DESC
LIMIT 10;

/* B2. Top 10 products by units sold (top 5 in README) */
SELECT Product, SUM(Units_Sold) AS units_total
FROM Sales
GROUP BY Product
ORDER BY units_total DESC
LIMIT 5;

/* B3. Total revenue by country */
SELECT Country, ROUND(SUM(Net_Sales),2) AS total_revenue,
       ROUND(SUM(Net_Profit),2) AS total_profit
FROM Sales
GROUP BY Country
ORDER BY total_revenue DESC;

/* B4. Total units sold & profit by segment */
SELECT Segment,
       SUM(Units_Sold) AS total_units,
       ROUND(SUM(Net_Sales),2) AS total_revenue,
       ROUND(SUM(Net_Profit),2) AS total_profit
FROM Sales
GROUP BY Segment
ORDER BY total_revenue DESC;

/* B5. Avg gross profit per product (per-row average) */
SELECT Product, ROUND(AVG(Gross_Profit),2) AS avg_gross_profit
FROM Sales
GROUP BY Product
ORDER BY avg_gross_profit DESC;

-- ============================================================
-- SECTION C — Time-series: monthly, quarterly, YoY
-- ============================================================

/* C1. Year-month totals (works for Year, Month_Number columns) */
SELECT
  Year,
  Month_Number,
  ROUND(SUM(Net_Sales),2) AS monthly_sales,
  ROUND(SUM(Net_Profit),2) AS monthly_profit
FROM Sales
GROUP BY Year, Month_Number
ORDER BY Year, Month_Number;

/* C2. Quarterly aggregation using CTE */
WITH monthly AS (
  SELECT Year,
         Month_Number,
         SUM(Net_Sales) AS rev
  FROM Sales
  GROUP BY Year, Month_Number
)
SELECT
  Year,
  (( (Month_Number - 1) / 3 ) + 1) AS Quarter,
  ROUND(SUM(rev),2) AS quarter_revenue
FROM monthly
GROUP BY Year, (( (Month_Number - 1) / 3 ) + 1)
ORDER BY Year, Quarter;

/* C3. YoY growth for each month (compare same month prev year) */
WITH month_totals AS (
  SELECT Year, Month_Number, SUM(Net_Sales) AS revenue
  FROM Sales
  GROUP BY Year, Month_Number
)
SELECT cur.Year,
       cur.Month_Number,
       ROUND(cur.revenue,2) AS revenue_current,
       ROUND(prev.revenue,2) AS revenue_prev_year,
       ROUND((cur.revenue * 1.0 / NULLIF(prev.revenue,0) - 1) * 100, 2) AS yoy_growth_pct
FROM month_totals cur
LEFT JOIN month_totals prev
  ON cur.Month_Number = prev.Month_Number
 AND cur.Year = prev.Year + 1
ORDER BY cur.Year, cur.Month_Number;

-- ============================================================
-- SECTION D — Window functions, ranking, cumulative %
-- ============================================================

/* D1. Rank products by profit margin (profit margin = sum(net_profit)/sum(net_sales)) */
SELECT Product,
       ROUND(SUM(Net_Profit),2) AS total_profit,
       ROUND(SUM(Net_Sales),2) AS total_sales,
       ROUND( (SUM(Net_Profit)*1.0 / NULLIF(SUM(Net_Sales),0))*100, 2) AS profit_margin_pct,
       RANK() OVER (ORDER BY (SUM(Net_Profit)*1.0 / NULLIF(SUM(Net_Sales),0)) DESC) AS overall_rank
FROM Sales
GROUP BY Product
ORDER BY profit_margin_pct DESC;

/* D2. Cumulative % of revenue by country (Pareto) */
SELECT
  Country,
  total_revenue,
  ROUND( (SUM(total_revenue) OVER (ORDER BY total_revenue DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
         / SUM(total_revenue) OVER () * 100), 2) AS cumulative_pct
FROM (
  SELECT Country, SUM(Net_Sales) AS total_revenue
  FROM Sales
  GROUP BY Country
) t
ORDER BY total_revenue DESC;

-- ============================================================
-- SECTION E — CASE / banding / flagging
-- ============================================================

/* E1. Expense banding by country (example thresholds; adjust to scale) */
SELECT Country,
       ROUND(SUM(Operating_Expenses),2) AS total_expenses,
       CASE
         WHEN SUM(Operating_Expenses) < 100000 THEN 'Low'
         WHEN SUM(Operating_Expenses) BETWEEN 100000 AND 500000 THEN 'Medium'
         ELSE 'High'
       END AS expense_band
FROM Sales
GROUP BY Country
ORDER BY total_expenses DESC;

/* E2. Months with negative net profit */
SELECT Year, Month_Number, ROUND(SUM(Net_Profit),2) AS month_net_profit
FROM Sales
GROUP BY Year, Month_Number
HAVING SUM(Net_Profit) < 0
ORDER BY Year, Month_Number;

-- ============================================================
-- SECTION F — Derived tables & subqueries (correlated & derived)
-- ============================================================

/* F1. Derived table: product-month combos with monthly_rev > 200000 */
SELECT product, Year, Month_Number, monthly_rev
FROM (
  SELECT Product AS product, Year, Month_Number, SUM(Net_Sales) AS monthly_rev
  FROM Sales
  GROUP BY Product, Year, Month_Number
) t
WHERE monthly_rev > 200000
ORDER BY monthly_rev DESC;

/* F2. Correlated subqueries: per-product txn_count & total_revenue (works but watch performance) */
SELECT
  p.Product,
  (SELECT COUNT(*) FROM Sales s2 WHERE s2.Product = p.Product) AS txn_count,
  (SELECT ROUND(SUM(Net_Sales),2) FROM Sales s3 WHERE s3.Product = p.Product) AS total_revenue
FROM (SELECT DISTINCT Product FROM Sales) p
ORDER BY total_revenue DESC
LIMIT 20;

/* F3. HAVING with subquery: segments with total_revenue > avg(segment_total) */
SELECT Segment, ROUND(SUM(Net_Sales),2) AS total_revenue
FROM Sales
GROUP BY Segment
HAVING SUM(Net_Sales) >
  (
    SELECT AVG(total_rev) FROM (
      SELECT SUM(Net_Sales) AS total_rev
      FROM Sales
      GROUP BY Segment
    )
  );

-- ============================================================
-- SECTION G — JOINs demo (CROSS, INNER, LEFT, SELF)
-- ============================================================

/* G1. CROSS JOIN (Cartesian) - learning demo: customers × orders */
SELECT c.name AS customer_name, o.order_id, o.amount
FROM customers c
CROSS JOIN orders o
ORDER BY c.customer_id, o.order_id
LIMIT 50;

/* G2. INNER JOIN: customers with orders only */
SELECT c.customer_id, c.name, o.order_id, o.amount
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

/* G3. LEFT JOIN: all customers, show NULL for no-orders */
SELECT c.customer_id, c.name, o.order_id, o.amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

/* G4. SELF JOIN: customers in same city (pairs) */
SELECT A.customer_id AS cust_a, A.name AS name_a, B.customer_id AS cust_b, B.name AS name_b, A.city
FROM customers A
JOIN customers B ON A.city = B.city
WHERE A.customer_id < B.customer_id
ORDER BY A.city;

-- ============================================================
-- SECTION H — Retail mini project quick queries (Retail_Sales table)
-- ============================================================

/* H1. Top 5 products by revenue (retail) */
SELECT Product,
       ROUND(SUM(Net_Sales),2) AS total_revenue,
       SUM(Units) AS units_sold
FROM Retail_Sales
GROUP BY Product
ORDER BY total_revenue DESC
LIMIT 5;

/* H2. Monthly total sales (retail) */
SELECT substr(Order_Date, 1, 7) AS year_month,
       ROUND(SUM(Net_Sales),2) AS monthly_sales,
       ROUND(SUM(Profit),2) AS monthly_profit
FROM Retail_Sales
GROUP BY year_month
ORDER BY year_month;

/* H3. Customers with > 5 orders (retail) */
SELECT customer_id, COUNT(*) AS orders_count
FROM Retail_Sales
GROUP BY customer_id
HAVING COUNT(*) > 5
ORDER BY orders_count DESC;

/* H4. Avg profit per product (retail) */
SELECT Product, ROUND(AVG(Profit),2) AS avg_profit_per_txn
FROM Retail_Sales
GROUP BY Product
ORDER BY avg_profit_per_txn DESC;

-- ============================================================
-- SECTION I — Finance-specific analyses & ROI
-- ============================================================

/* I1. Top 5 cost centers by total operating expense (if you have cost_center column) */
-- Adjust column name if needed; example assumes Cost_Center exists
SELECT Cost_Center, ROUND(SUM(Operating_Expenses),2) AS total_expenses
FROM Sales
GROUP BY Cost_Center
ORDER BY total_expenses DESC
LIMIT 5;

/* I2. Months with negative profit (finance) */
SELECT Year, Month_Number, ROUND(SUM(Net_Profit),2) AS month_net_profit
FROM Sales
GROUP BY Year, Month_Number
HAVING SUM(Net_Profit) < 0
ORDER BY Year, Month_Number;

/* I3. Average monthly ROI (Net_Profit / Operating_Expenses) — proxy */
SELECT Year, Month_Number,
       ROUND( AVG( (Net_Profit * 1.0) / NULLIF(Operating_Expenses,0) ), 4) AS avg_monthly_roi
FROM Sales
GROUP BY Year, Month_Number
ORDER BY Year, Month_Number;

-- ============================================================
-- END OF FILE
-- Save screenshots for each section and reference them in README.md
-- ============================================================
