**📘 FINANCE MINI PROJECT — SQL ANALYSIS**

This project performs a complete SQL-based financial analysis using a real-world style dataset containing revenue, expenses, profit, product sales, and country-level financial performance.
It includes 22 SQL queries covering:

Aggregations

Window functions

Joins (INNER, LEFT, CROSS, SELF)

CTEs

Subqueries (IN, HAVING, SELECT, FROM)

Profitability analysis

Time-series breakdowns

Expense banding

Month/quarter revenue trends

Derived tables

All queries are executed using SQLite (DB Browser for SQLite).

**⭐ 1. Project Overview
**

This project analyzes the Finance_Data dataset to understand:

Top revenue and profit contributors

Product performance

Country-wise financial health

Segment-wise profitability

Monthly & quarterly revenue trends

Expense band classification

Negative profit periods

Dataset validation (sanity checks)

The goal is to replicate real analytical workflows commonly used in finance teams.

**⭐ 2. Dataset Description**

Columns used in analysis:

Segment

Country

Product

Discount_Band

Units_Sold

Manufacturing_Price

Sale_Price

Gross_Sales

Discounts

Net_Sales

COGS

Gross_Profit

Operating_Expenses

Other_Income

Net_Profit

Profit_Margin_%

Year

Month_Number

**⭐ 3. SQL Queries & Insights (Phase 1)**
Query 1 — Top 10 Most Profitable Products

📎 Screenshot →
Top_10_Most_Profitable_Products.png

Insight: Paseo is the strongest overall product in profitability.

Query 2 — Total Revenue by Country

📎 Screenshot →
Total_Revenue_by_Country.png

Insight: USA has the highest revenue but negative net profit — high revenue ≠ profitability.

Query 3 — Total Units Sold by Segment

📎 Screenshot →
Total_Units_Sold_by_Segment.png

Insight: Government is the largest volume driver.

Query 4 — Average Gross Profit by Product

📎 Screenshot →
Average_Gross_Profit_by_Product.png

Insight: Amarilla yields the highest gross profit per unit.

Query 5 — Highest Revenue Months

📎 Screenshot →
Highest_Revenue_Months.png

Insight: 2014 Month 10, 12, and 6 are revenue peaks.

Query 6 — Top 10 Countries by Net Profit

📎 Screenshot →
Top_10_Countries_by_Total_Net_Profit.png

Insight: Germany & France outperform USA in profit.

Query 7 — Fresh Profit Margin Calculation

📎 Screenshot →
Fresh_Profit_Margin_Calculation.png

Insight: Amarilla has the highest margin; Velo the lowest.

Query 8 — Expenses vs Revenue Breakdown

📎 Screenshot →
Expenses_vs_Revenue_breakdown.png

Insight: USA has extremely high expenses — major cause of negative profitability.

Query 9 — Year-Wise Total Revenue

📎 Screenshot →
Year_wise_Total_Revenue.png

Insight: Revenue consistently increases YoY.

Query 10 — Best Selling Products (Units Sold)

📎 Screenshot →
Best_Selling_Products_by_Units_Sold.png

Insight: Paseo again leads in units sold.

**⭐ 4. SQL Queries & Insights (Phase 2)**
Query — Revenue & Profit by Segment

📎 Screenshot →
Revenue_and_profit_by_segment.png

Insight:

Government is strongest in both revenue & profit

Enterprise: high revenue but negative profit

Channel Partners: small but high margin

Query — Quarterly Revenue via CTE

📎 Screenshot →
Quaterly_aggregation_using_CTE.png

Insight: Revenue spikes in Q3 & Q4; Q1 is weakest.

Query — Expense Banding

📎 Screenshot →
Expense_banding.png

Insight:

Canada = High expense band

USA & France = Medium

Germany & Mexico = Low

Query — Months with Negative Net Profit

📎 Screenshot →
Month_with_negative_net_profit.png

Insight:
November is the only month with losses in both years.

**⭐ 5. SQL Queries & Insights (Phase 3)**

(Join operations, derived tables, subqueries)

CROSS JOIN — Customers × Orders

📎 Screenshot →
Cross_join.png

Insight: Demonstrates Cartesian explosion; not used in analytics.

INNER JOIN — Customers With Orders

📎 Screenshot →
Inner_join.png

Insight: Shows only active customers.

LEFT JOIN — All Customers, Including Non-Ordering

📎 Screenshot →
Left_join.png

Insight: Identifies inactive customers.

SELF JOIN — Customers in the Same City

📎 Screenshot →
Self_join.png

Insight: Helps find potential referral/cluster patterns.

Derived Table — Monthly Product Revenue > 200k

📎 Screenshot →
Derived_table_monthly_product_revenue.png

Insight: Highlights high-spike product-month combinations.

Per-Product Transaction Count & Revenue

📎 Screenshot →
Per_product_count_revenue.png

Insight: Paseo leads in both transactions & revenue.

Segments Above Average Revenue (HAVING + Subquery)

📎 Screenshot →
Segments_above_avg_revenue.png

Segments Selling Above-Average Products

📎 Screenshot →
Totalrevenue_greater_than_avgrevenue.png

**⭐ 6. Key Business Insights (Combined)**
✔ Government is the top-performing segment in both revenue and profit
✔ USA has highest revenue but negative net profit
✔ Germany & France deliver strong margins
✔ Paseo dominates both profit and units sold
✔ Amarilla has the highest gross profit per unit
✔ Q3 & Q4 outperform other quarters consistently
✔ November appears as a repeated loss month
✔ Expense structure varies drastically by country
**⭐ 7. SQL Concepts Used**

SUM(), AVG(), COUNT()

GROUP BY, ORDER BY, LIMIT

CASE WHEN

HAVING

CTE (WITH clause)

INNER JOIN, LEFT JOIN, CROSS JOIN, SELF JOIN

Derived tables

Correlated subqueries

Window functions

Data validation & sanity checks

**⭐ 8. Tools Used**

DB Browser for SQLite

Excel

GitHub

VS Code / SQL Editor

**⭐ 9. Project Files**

Finance_Mini_Project_SQL/
│── Finance_mini_project.sql
│── Finance_data.csv
│── Finance_data.db
│── screenshots/
│    ├── Average_Gross_Profit_by_Product.png
│    ├── Best_Selling_Products_by_Units_Sold.png
│    ├── Cross_join.png
│    ├── Derived_table_monthly_product_revenue.png
│    ├── Expense_banding.png
│    ├── Expenses_vs_Revenue_breakdown.png
│    ├── Fresh_Profit_Margin_Calculation.png
│    ├── Highest_Revenue_Months.png
│    ├── Inner_join.png
│    ├── Left_join.png
│    ├── Month_with_negative_net_profit.png
│    ├── Per_product_count_revenue.png
│    ├── Quaterly_aggregation_using_CTE.png
│    ├── Revenue_and_profit_by_segment.png
│    ├── Segments_above_avg_revenue.png
│    ├── Self_join.png
│    ├── Top_10_Countries_by_Total_Net_Profit.png
│    ├── Top_10_Most_Profitable_Products.png
│    ├── Total_Revenue_by_Country.png
│    ├── Total_Units_Sold_by_Segment.png
│    ├── Totalrevenue_greater_than_avgrevenue.png
│    ├── Year_wise_Total_Revenue.png
