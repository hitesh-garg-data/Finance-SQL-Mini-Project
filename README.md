📘 **Finance SQL Mini Project — Analysis Summary**
Designed to demonstrate SQL skills for Data Analyst / Finance Analyst roles.

This project performs a structured financial analysis using SQL on the Finance_Data dataset.
It includes 22 SQL queries covering profitability analysis, revenue trends, segmentation insights, expense evaluation, and dataset validation.

Full details (SQL logic + comments) are available inside the .sql file and the extended markdown documentation.

⭐ **1. Project Overview**

- Analyzed financial dataset using SQL (Revenue, Net Profit, Expenses, Units Sold)
- Identified top products, profitable countries, and high-performing segments
- Explored monthly & quarterly revenue patterns using CTEs
- Used joins, window functions, subqueries, CASE logic, and sanity checks
- Created insights for business decisions and profitability improvement


📄 **Detailed analysis**:
Readme_Finance_Mini_Project_SQL.md
https://github.com/hitesh-garg-data/Finance-SQL-Mini-Project/blob/main/finance_sql_project/Readme_Finance_Mini_Project_SQL.md


🧠 **Full SQL logic + commented queries:**
Finance_mini_project.sql
https://github.com/hitesh-garg-data/Finance-SQL-Mini-Project/blob/main/finance_sql_project/Finance_mini_project.sql

📸 **All 22 screenshots:**
Located in /screenshots/ folder.

⭐ **2. Key Insights**
### Product Insights
- Paseo ranks #1 in both total profit and units sold.
- Amarilla delivers the highest profit margin per unit.

### Country Insights
- USA has the highest revenue but negative net profit → high operational expenses.
- Germany & France are the most profitable regions.

### Segment Insights
- Government segment performs best in both revenue & profitability.
- Enterprise segment shows high revenue but negative profit.
- Channel Partners → low volume but high margins.

### Time-Series Insights
- Revenue peaks in Months 10, 12, and 6 of 2014.
- Q3 and Q4 consistently outperform earlier quarters.
- November shows losses in both years.

### Expense Banding
- Canada classified as High-expense country.
- Germany & Mexico classified as Low-expense countries.

**⭐ 3. SQL Concepts Used**

- Aggregations: SUM, AVG, COUNT, ROUND
- Grouping & Sorting: GROUP BY, ORDER BY, LIMIT
- Filtering: WHERE, HAVING
- JOINs: INNER, LEFT, CROSS, SELF
- CTEs: WITH clause for quarterly revenue and summary tables
- Window functions: RANK() for product ranking
- Subqueries: correlated, derived, HAVING subqueries
- CASE statements: expense banding
- Data validation: consistency check between computed and actual profit


**⭐ 4. Project Files**

```text
Finance_SQL_Mini_Project/
├── Finance_mini_project.sql            # Full SQL with comments + all queries
├── Finance_data.csv
├── Finance_data.db
├── Readme_Finance_Mini_Project_SQL.md  # Full narrative analysis
└── screenshots/                        # 22 query result screenshots

```
**⭐ 5. Tools Used**

- DB Browser for SQLite
- SQLite SQL Engine
- Excel (preprocessing)
- GitHub (version control)

**Note:** Some aggregate query screenshots may show a NULL row due to an Excel table “Total Row” being included in the source data during early preprocessing and later exported to CSV. This was identified as a data hygiene issue and does not affect the SQL logic or analytical conclusions.
