**📘 Finance SQL Mini Project — End-to-End Analysis**

This project performs financial analytics using SQL, covering revenue, profitability, cost analysis, segmentation, time-series analysis, and advanced SQL patterns (CTEs, joins, window functions, subqueries).

Dataset: Finance_Data
Rows: ~700+
Fields include Revenue, Net Profit, COGS, Operating Expenses, Product, Segment, Country, Year, Month, etc.

finance_sql_project/
│── Finance_mini_project.sql
│── Finance_mini_project.db
│── Finance_mini_project.csv
│── Readme_Finance_Mini_Project_SQL.md
│── screenshots/
│     ├── Average_Gross_Profit_by_Product.png
│     ├── Best_Selling_Products_by_Units_Sold.png
│     ├── Cross_join.png
│     ├── Derived_table_monthly_product_revenue.png
│     ├── Expense_banding.png
│     ├── Expenses_vs_Revenue_breakdown.png
│     ├── Fresh_Profit_Margin_Calculation.png
│     ├── Highest_Revenue_Months.png
│     ├── Inner_join.png
│     ├── Left_join.png
│     ├── Month_with_negative_net_profit.png
│     ├── Per_product_count_revenue.png
│     ├── Quaterly_aggregation_using_CTE.png
│     ├── Revenue_and_profit_by_segment.png
│     ├── Segments_above_avg_revenue.png
│     ├── Self_join.png
│     ├── Top_10_Countries_by_Total_Net_Profit.png
│     ├── Top_10_Most_Profitable_Products.png
│     ├── Total_Revenue_by_Country.png
│     ├── Total_Units_Sold_by_Segment.png
│     ├── Totalrevenue_greater_than_avgrevenue.png
│     ├── Year_wise_Total_Revenue.png


**#️⃣ 1. Project Overview**

This mini-project focuses on end-to-end SQL financial analysis, including:

✔ Revenue analytics
✔ Profitability analysis (gross and net)
✔ Segment & country performance
✔ Time-series trends (monthly, quarterly, YoY)
✔ Cost and expense banding
✔ Advanced SQL patterns (CTEs, joins, correlated subqueries, window functions)

The goal is to simulate real-world finance analytics similar to enterprise BI workflows.

**#️⃣ 2. Dataset Description**

Key fields:

Segment – Customer segment

Country – Market

Product – SKU

Units_Sold – Units sold

Revenue – Net sales

Operating_Expenses – Expense fields

Net_Profit – Final profit

COGS, Discounts, Gross_Profit

Year, Month_Number – Time series columns

**#️⃣ 3. SQL Queries & Insights (Phase 1)**
🟦 Query 1 — Top 10 Most Profitable Products
SELECT Product, SUM(Net_Profit) AS Total_Profit
FROM Sales
GROUP BY Product
ORDER BY Total_Profit DESC
LIMIT 10;


📸 Screenshot:


Insights

Paseo leads with the highest total profit.

Amarilla & Velo follow with strong profitability.

🟦 Query 2 — Total Revenue by Country
SELECT Country, SUM(Revenue) AS Total_Revenue
FROM Sales
GROUP BY Country
ORDER BY Total_Revenue DESC;


📸


Insights

USA generates the highest revenue but runs at a net loss.

Germany & France are the most profitable markets.

🟦 Query 3 — Total Units Sold by Segment
SELECT Segment, SUM(Units_Sold) AS Total_Units
FROM Sales
GROUP BY Segment
ORDER BY Total_Units DESC;


📸


Insights

Government is the biggest volume driver.

Enterprise shows high revenue but negative profitability.

🟦 Query 4 — Average Gross Profit by Product

📸


Key insight: Amarilla has the highest avg gross profit per unit.

🟦 Query 5 — Highest Revenue Months

📸


Seasonal trend: Months 10, 12, 6 are peak revenue months.

🟦 Query 6 — Top 10 Countries by Net Profit

📸


Germany & France show strong net profitability.

🟦 Query 7 — Fresh Profit Margin Calculation

📸


Profit margins vary heavily:

Highest: Amarilla (~3.27%)

Lowest: Velo (~0.66%)

🟦 Query 8 — Expenses vs Revenue

📸


USA has highest revenue + highest expenses → net negative.

🟦 Query 9 — Year-wise Total Revenue

📸


Clear YoY revenue growth.

🟦 Query 10 — Best Selling Products (Units)

📸


Paseo dominates in both units and profit.

**#️⃣ 4. SQL Queries & Insights (Phase 2)**
🟩 Query — Revenue & Profit by Segment

📸


Insights:

Small Business: high revenue, negative profit → pricing/cost issue.

Government: strongest revenue + profit.

Channel Partners: high margin efficiency.

🟩 Quarterly Aggregation (CTE)

📸


Insights:

Q3 & Q4 outperform Q1 & Q2.

Clear seasonal growth patterns.

🟩 Expense Banding (CASE)

📸


Insights:

Canada → High expense band

Germany & Mexico → Lean operations

🟩 Months with Negative Net Profit

📸


Insights:

Only 4 month-year combinations show losses.

November is the only month with losses in both years.

**#️⃣ 5. SQL Queries & Insights (Phase 3 — Advanced SQL)**
🟨 CROSS JOIN

📸


🟨 INNER JOIN

📸


🟨 LEFT JOIN

📸


🟨 SELF JOIN

📸


🟨 Derived Table — Monthly Revenue > 200K

📸


🟨 Correlated Subquery — Per Product Revenue

📸


🟨 HAVING Subquery — Segments Above Avg Revenue

📸


🟨 Products With Revenue > Avg Product Revenue

📸


**#️⃣ 6. Dataset Dictionary**

(Already prepared — keeping your version.)

**#️⃣ 7. SQL Concepts Used**

✔ GROUP BY, ORDER BY, LIMIT
✔ CTEs
✔ Window functions (RANK, cumulative %)
✔ CASE statements
✔ Derived tables
✔ Correlated subqueries
✔ Joins (CROSS, INNER, LEFT, SELF)
✔ Data validation checks
✔ Time-series analytics (monthly, quarterly, YoY)

**#️⃣ 8. Tools Used**

DB Browser for SQLite

Excel for preprocessing

GitHub for versioning

Notion for documentation
