

\# 📘 \*\*FINANCE MINI PROJECT — SQL ANALYSIS (FULL README STRUCTURE)\*\*





---



\# \*\*1. Project Overview\*\*



A short description of what this finance mini project is:



\* Built using \*\*Finance\_Data\*\* dataset (revenues, expenses, profit, segments, countries, products).

\* Performed \*\*exploratory financial analysis\*\*, \*\*profitability analysis\*\*, \*\*segment \& country performance\*\*, and \*\*cost structure evaluation\*\* using SQL.

\* Queries include: aggregations, grouping, window functions, CTEs, CASE logic, joins, and dataset validation checks.



---



\# \*\*2. Dataset Description\*\*



Brief description of columns:



\* Segment

\* Country

\* Product

\* Discount\_Band

\* Units\_Sold

\* Manufacturing\_Price

\* Sale\_Price

\* Gross\_Sales

\* Discounts

\* Net\_Sales	

\* COGS

\* Gross\_Profit

\* Date

\* Month\_Number

\* Year

\* Revenue

\* Operating\_Expenses

\* Other\_Income

\* Net\_Profit

\* Profit\_Margin\_%



---



\# \*\*3. SQL Queries \& Insights phase 1 \*\*

\*\*Query — Top 10 Most Profitable Products\*\*







SELECT Product, SUM(Net\\\_Profit) AS Total\\\_Profit



FROM Sales



GROUP BY Product



ORDER BY Total\\\_Profit DESC



LIMIT 10;







\*\*Query  — Total Revenue by Country\*\*







SELECT Country, SUM(Revenue) AS Total\\\_Revenue



FROM Sales



GROUP BY Country



ORDER BY Total\\\_Revenue DESC;







\*\*Query  — Total Units Sold by Segment\*\*







SELECT Segment, SUM(Units\\\_Sold) AS Total\\\_Units



FROM Sales



GROUP BY Segment



ORDER BY Total\\\_Units DESC;











\*\*Query  — Average Gross Profit by Product\*\*







SELECT Product, AVG(Gross\\\_Profit) AS avg\\\_gross\\\_profit



FROM Sales



GROUP BY Product



ORDER BY avg\\\_gross\\\_profit DESC;







\*\*Query  - Highest Revenue Months\*\*







SELECT 



\&nbsp;   Year, 



\&nbsp;   "Month number", 



\&nbsp;   SUM(Revenue) AS Monthly\\\_Revenue



FROM Sales



GROUP BY Year, "Month number"



ORDER BY Monthly\\\_Revenue DESC;







\*\*Query - Top 10 Countries by Total Net Profit\*\*







Select Country, sum(net\\\_profit) as Total\\\_net\\\_profit



from Sales



group by Country



order by Total\\\_net\\\_profit DESC







\*\*Query \*\* Fresh Profit Margin Calculation (no % column needed)



SELECT 



\&nbsp;   Product,



\&nbsp;   SUM(Net\\\_Profit) AS Total\\\_Profit,



\&nbsp;   SUM(Gross\\\_Sales) AS Total\\\_Sales,



\&nbsp;   (SUM(Net\\\_Profit) \\\* 1.0 / SUM(Gross\\\_Sales)) AS Profit\\\_Margin



FROM Sales



GROUP BY Product



ORDER BY Profit\\\_Margin DESC;







\*\*Query  Expenses vs Revenue breakdown\*\*







select Country,



sum (revenue) as total\\\_revenue,



sum(operating\\\_expenses) as Total\\\_expenses,



Sum (other\\\_income) as Total\\\_other\\\_income



from Sales



group by Country



order by Total\\\_revenue desc;







\*\*Query \*\* Year-wise Total Revenue







SELECT 



\&nbsp;   Year,



\&nbsp;   SUM(Revenue) AS Total\\\_Revenue



FROM Sales



GROUP BY Year



ORDER BY Year;







\*\*Query \*\* Best Selling Products by Units Sold (Top 5)



SELECT Product, SUM(Units\\\_Sold) AS Units\\\_Total



FROM Sales



GROUP BY Product



ORDER BY Units\\\_Total DESC



LIMIT 5;



Insights observed in dataset from these queries?\*\*







\*\*1. The United States has the highest revenue but shows overall net loss.\*\*







Despite generating the highest total revenue (~25M),







The U.S. has negative total net profit (~ -14,000)







This means expenses + COGS + discounts > revenue







A classic business insight: high sales does NOT guarantee profitability.







\*\*2. Germany and France are the most profitable countries.\*\*







Germany: ~945k net profit







France: ~786k



These markets generate lower revenue than the U.S. but produce significantly higher profit, meaning better cost control and margins.







\*\*3. Paseo dominates both total units sold and total profit.\*\*







Highest total units sold (~338,239 units)







Very high total profit (~810k)



This makes Paseo the strongest performing product overall.







\*\*4. Amarilla has the highest average gross profit per unit.\*\*







Even though Paseo sells more, Amarilla gives the highest gross profit per unit (avg ~29,937).







\*\*5. Enterprise and Government segments lead in total units sold.\*\*







Your segment-level query shows:







Government: ~470k units







Enterprise: ~168k



Government is the biggest volume driver for the business.







\*\*6. Months 10, 12, and 6 of 2014 are the highest-revenue months.\*\*







Your monthly revenue query shows peak months in 2014:







October (10)







December (12)







June (6)



Indicating seasonal or cyclical patterns.







\*\*7. Dataset contains 7 unique products.\*\*







That’s why LIMIT 10 queries return only 7 rows.







\*\*8. Profit margin varies widely across products.\*\*







Highest margin product: Amarilla (~3.27%)







Lowest margin: Velo (~0.66%)



Some products generate high revenue but poor profitability.



\# \*\*4. SQL Queries \& Insights -phase 2\*\*

\*\*1\*\* \*\*Revenue and profit by segment\*\*







select Segment,



sum (Revenue) as Total\\\_revenue,



sum (Net\\\_Profit) as Total\\\_profit



from Sales



group by Segment



order by Total\\\_revenue DESC







\*\*2 Quaterly aggregation using CTE\*\*







WITH monthly AS (



SELECT



year,



Month\\\_Number,



sum (Revenue) as Revenue



from Sales



Group by Year, Month\\\_Number



)



SELECT



year,



ceil(Month\\\_number/3.0) As quarter,



sum(Revenue) as Quarter\\\_revenue



from monthly



Group by Year, ceil(Month\\\_number/3.0)



Order by Year, Quarter;







\*\*3 Expense banding\*\*







SELECT



country,



sum(operating\\\_expenses) as Total\\\_expenses,



CASE



WHEN sum(operating\\\_expenses)<3500000 THEN 'low'



WHEN sum (Operating\\\_Expenses) BETWEEN 3500000 AND 3800000 THEN 'Medium'



ELSE 'High'



end as Expense\\\_band



from Sales



group by Country



order by Total\\\_Expenses DESC







\*\*4 Month with negative net profit\*\*







SELECT



year,



Month\\\_Number,



sum(Net\\\_profit) as Month\\\_net\\\_profit



from Sales



group by year, Month\\\_Number



HAVING sum(Net\\\_profit)<0



order by Year, Month\\\_Number;







\*\*\*✅ INSIGHTS FOR QUERY  — Revenue \\\& Profit by Segment\*\*\*



\*\*\*1️⃣ Small Business has the 2nd-highest revenue but a negative total net profit.\*\*\*







This means the segment generates strong sales volume but is operating unprofitably due to high costs, low margins, or discounting.







\*\*\*2️⃣ Government is the strongest segment overall – highest revenue and highest net profit.\*\*\*







Government customers contribute most to both top-line and bottom-line performance.







\*\*\*3️⃣ Enterprise segment shows very high revenue but deeply negative profit.\*\*\*







This is a major loss-making segment, indicating inefficiency, high COGS, or unsustainable pricing.







\*\*\*4️⃣ Channel Partners show the healthiest profit ratio relative to revenue.\*\*\*







This segment is small in volume but highly profitable, signaling strong margins.







\*\*\*✅ INSIGHTS FOR QUERY  — Quarterly Revenue (Your Quarterly Table)\*\*\*



\*\*\*1️⃣ Revenue shows strong seasonality — Q3 \\\& Q4 tend to outperform earlier quarters.\*\*\*







Later quarters contribute more revenue, suggesting year-end spending spikes.







\*\*\*2️⃣ Year-over-year growth is visible — 2014 quarters consistently higher than 2013.\*\*\*







This signals healthy annual growth in the business.







\*\*\*3️⃣ Lowest quarterly revenue appears in Q1 across both years.\*\*\*







Early-year performance is historically weaker, pointing to seasonality or budget cycles.







\*\*\*✅ INSIGHTS FOR QUERY  — Expense Banding (CASE Analysis)\*\*\*



\*\*\*1️⃣ Canada has the highest operating expenses, placing it in the ‘High’ expense band.\*\*\*







This indicates higher operational cost structure or expensive logistics.







\*\*\*2️⃣ USA and France fall into the Medium band — steady but controlled expenses.\*\*\*







They have balanced spending relative to activity.







\*\*\*3️⃣ Germany and Mexico fall into the Low band — lean and efficient operations.\*\*\*







These regions are potentially high-margin markets due to lower cost pressure.







\*\*\*✅ INSIGHTS FOR QUERY  — Months with Negative Net Profit\*\*\*



\*\*\*1️⃣ Only 4 month-year combinations show negative net profit — mostly isolated events.\*\*\*







The business is generally profitable overall, with occasional dips.







\*\*\*2️⃣ The biggest loss occurred in November 2013 (Month 11, Year 2013).\*\*\*







This month could reflect unexpected expenses or a major discounting event.







\*\*\*3️⃣ Loss events also appear in March 2014, July 2014, and November 2014.\*\*\*







This suggests intermittent operational inefficiencies, not a continuous trend.







\*\*\*4️⃣ November is the only month showing losses in both years.\*\*\*







Possible indicator of seasonal operational strain or high pre-holiday spending.





\# \*\*5. SQL Queries \& Insights -phase 3\*\*



**1 — CROSS JOIN (customers × orders — Cartesian product)**



SELECT c.name AS customer\_name, o.order\_id, o.amount

FROM customers c

CROSS JOIN orders o

ORDER BY c.customer\_id, o.order\_id;





**Observations**



Produces every possible customer × order pair (20 rows in result).



Useful for understanding the effect of Cartesian product and why it’s usually not used for analytics.



**Why it matters**



CROSS JOIN is a learning tool — it quickly exposes the risk of multiplying rows and creating meaningless duplicates when you forget a proper join condition.



**Next actions**



Avoid CROSS JOIN for real metrics unless you intentionally want Cartesian results (e.g., pricing matrix).



Use INNER/LEFT JOIN with ON clause to connect real relations.



If you ever see an unexpectedly large resultset, check for missing ON clauses first.



**2 — INNER JOIN (customers with orders only)**



SELECT c.customer\_id, c.name, o.order\_id, o.amount

FROM customers c

INNER JOIN orders o ON c.customer\_id = o.customer\_id

ORDER BY c.customer\_id;





**Observations**



Returned only customers who have matching orders (4 rows).



Customers without orders are excluded (Ali was excluded here).



**Why it matters**



INNER JOIN gives a clean view of “active” entities (customers with transactions), perfect for transaction-level reports.



Good for calculating totals where you explicitly want to ignore non-participants.



**Next actions**



Use INNER JOIN for revenue KPIs (revenue = sum of joined rows).



If you need counts of customers and their orders (including zero), use LEFT JOIN instead (see next).



Validate join keys (customer\_id duplicates) to avoid duplicates or missing matches.



**3 — LEFT JOIN (all customers, even with no orders)**



SELECT c.customer\_id, c.name, o.order\_id, o.amount

FROM customers c

LEFT JOIN orders o ON c.customer\_id = o.customer\_id

ORDER BY c.customer\_id;





**Observations** 



Includes customers without orders (Ali appears with NULL order fields).



Good to spot customers with zero activity.



**Why it matters**



Use LEFT JOIN to produce completeness: find inactive customers, run reactivation campaigns, or compute total\_orders per customer including zeros.



Crucial for denominators (e.g., revenue per customer where customers with 0 revenue must be counted).



**Next actions**



Build an activity summary: COUNT(o.order\_id) grouped by c.customer\_id (0 indicates inactive).



Use COALESCE to convert NULLs to 0 in reports: COALESCE(o.amount,0).



Consider right-sizing marketing lists for customers with 0 orders.



**4 — SELF JOIN (customers in same city)**



SELECT A.customer\_id AS cust\_a, A.name AS name\_a, B.customer\_id AS cust\_b, B.name AS name\_b, A.city

FROM customers A

JOIN customers B ON A.city = B.city

WHERE A.customer\_id < B.customer\_id

ORDER BY A.city;





**Observations** 



Returns customer pairs who share the same city (example: John \& Rohan in Delhi).



The A.customer\_id < B.customer\_id clause avoids duplicate reversed pairs.



Why it matters



Self-joins let you compare rows to other rows in the same table — useful for peer similarity, referral network detection, or joining a table to itself for adjacency relationships.



**Next actions**



Use for referral analytics: find customers in same city who might refer one another.



If needed, expand to include distance or zipcode to improve locality accuracy.



Be careful with performance on large tables; use indexes on join columns (city).



**5 — Derived table: monthly product revenue (filter monthly\_rev > 200,000)**



SELECT product, Year, Month\_Number, monthly\_rev

FROM (

&nbsp; SELECT Product AS product, Year, Month\_Number, SUM(Revenue) AS monthly\_rev

&nbsp; FROM Sales

&nbsp; GROUP BY Product, Year, Month\_Number

) t

WHERE monthly\_rev > 200000

ORDER BY monthly\_rev DESC;





**Observations**



Returned product-month combinations with monthly revenue above 200k (Amarilla, Paseo, Velo, Montana, etc.).



74 rows met the threshold.



**Why it matters**



Derived tables (subquery in FROM) let you compute intermediate aggregates for further filtering or analysis (here: product × month revenue).



Good for identifying hot pockets: months where products spike.



**Next actions**



Replace fixed threshold with percentile or dynamic threshold (top 5% of monthly\_rev) for robustness.



Drill into product-month rows with sudden spikes → check promotions, returns, or data quality.



Add SUM(Units) to this derived table to measure whether spikes were volume-driven or price-driven.



**6 — Subquery in SELECT: per-product txn\_count \& total\_revenue**



SELECT

&nbsp; p.Product,

&nbsp; (SELECT COUNT(\*) FROM Sales s2 WHERE s2.Product = p.Product) AS txn\_count,

&nbsp; (SELECT SUM(Revenue) FROM Sales s3 WHERE s3.Product = p.Product) AS total\_revenue

FROM (SELECT DISTINCT Product FROM Sales) p

ORDER BY total\_revenue DESC

LIMIT 20;





**Observations** 



Paseo is top (txn\_count 202, total\_revenue ≈ 33,011,143). VTT, Velo, Amarilla, Montana follow.





**Why it matters**



Correlated subqueries in SELECT provide per-row computed metrics (counts, sums) without explicit joins.



Useful for quick per-entity KPIs (transactions, revenue, avg revenue per transaction).



**Next actions**



Replace correlated subqueries with a single GROUP BY for performance when table grows:



SELECT Product, COUNT(\*) txn\_count, SUM(Revenue) total\_revenue

FROM Sales

GROUP BY Product

ORDER BY total\_revenue DESC;





Investigate NULL product rows and clean them or tag them as Unknown.



Add SUM(Units) and compute rev\_per\_unit = SUM(Revenue)/SUM(Units) for unit-economics.



**7 — Subquery in HAVING: segments with total\_revenue > avg(segment\_total)**



SELECT Segment, SUM(Revenue) AS total\_revenue

FROM Sales

GROUP BY Segment

HAVING total\_revenue >

(

&nbsp; SELECT AVG(total\_rev)

&nbsp; FROM (

&nbsp;   SELECT SUM(Revenue) AS total\_rev

&nbsp;   FROM Sales

&nbsp;   GROUP BY Segment

&nbsp; )

);





**Observations** 



Returned Government and Small Business as above-average by total revenue (Small Business had negative profit though — screenshot).



**Why it matters**



This pattern finds groups (segments) that are above the group-average (a relative benchmark). Good for spotting “above-average” buckets.



But beware: average is sensitive to outliers and can be less meaningful than median or percentile.



**Next actions**



Compute median or use percentiles to reduce outlier influence.



Combine this with profit metrics: total\_profit or rev\_per\_unit to avoid volume-only winners.



Drill into Small Business (high revenue + negative profit) to find cost drivers or heavy discounting.



**8 — Subquery in WHERE (IN): segments that sell at least one above-average product**



SELECT DISTINCT Segment

FROM Sales

WHERE Product IN (

&nbsp; SELECT Product

&nbsp; FROM Sales

&nbsp; GROUP BY Product

&nbsp; HAVING SUM(Revenue) >

&nbsp;   (

&nbsp;     SELECT AVG(prod\_rev)

&nbsp;     FROM (

&nbsp;       SELECT SUM(Revenue) AS prod\_rev

&nbsp;       FROM Sales

&nbsp;       GROUP BY Product

&nbsp;     )

&nbsp;   )

)

ORDER BY Segment;





**Observations** 



Returned five segments (Channel Partners, Enterprise, Government, Midmarket, Small Business).



This identifies segments that sell any product whose product-total > avg(product\_totals).



**Why it matters**



Good for mapping where “top products” are sold, but it’s a presence test (does segment sell at least one top product?), not a contribution test.



Presence ≠ dependence: a segment may contain a top product but may not derive significant % of its revenue from it.



**Next actions**



Instead of presence, compute contribution: how much of the segment revenue comes from those top products (see suggested JOIN/CTE earlier).



Use units or revenue-per-unit to classify top products for fairer detection .



Add time filters (last 12 months) to avoid old products skewing the result.



***✅ Overall headline insights (cross-query synthesis)***



Government is top in revenue \& profit (strategic anchor). Protect and grow contracts in this segment.



Small Business shows high revenue but negative net profit — immediate cost / pricing investigation needed.



Enterprise shows high revenue but negative profit in some runs — check for high COGS, promotions, or contractual discounts.



Channel Partners appear to have strong margins — focus on scaling and replicating that model.



Top product pockets (Paseo, Velo, Amarilla, Montana) drive large monthly spikes — analyze promotions, seasonality, and returns.



Units is the missing normalizer — use SUM(Revenue)/SUM(Units) to compare products fairly (recommended next step).



Temporal filters \& percentiles will make these insights production-grade — use last 12 months and top X% instead of raw averages.



**6 Dataset dictionary**

Segment – customer segment  

Country – market location  

Units\_Sold – number of units sold  

Revenue – net sales after discounts  

Operating\_Expenses – expenses associated  

Net\_Profit – final profit after costs  

Year / Month\_Number – time period fields  



**7. SQL Concepts Used**

Core Aggregation Functions



SUM() — Used to calculate total Revenue, Net Profit, Units Sold, Operating Expenses, etc.



AVG() — Used for computing average Gross Profit, average profit margins.



COUNT() — Used indirectly in HAVING filters or in subqueries to count transactions.



Grouping \& Sorting



GROUP BY — Grouping by Product, Country, Segment, Year, Month, etc.



ORDER BY — Sorting outputs by Revenue, Profit, Units Sold, etc.



LIMIT — Selecting top-N results (e.g., Top 10 profitable products).



Conditional Logic



CASE WHEN — Used for segmenting countries into Expense Bands (Low/Medium/High).



CTEs (WITH clause)



Used for:



Quarterly revenue calculation



Monthly intermediate tables



Cleaner, readable step-by-step transformations



Joins



CROSS JOIN — Demonstrated for Cartesian product understanding.



INNER JOIN — For matching customers with orders (only those with transactions).



LEFT JOIN — For including customers with no orders (completeness).



SELF JOIN — To compare customers within the same table (same city pairs).



Subqueries



Derived tables (subquery in FROM)

Used for monthly product revenue filtering (monthly\_rev > 200,000).



Correlated subqueries (in SELECT)

Used to compute per-product transaction count \& revenue without JOINs.



Subqueries in HAVING

Used to filter segments whose revenue > average segment revenue.



Subqueries in WHERE (IN)

Used to find segments selling top-performing products (above-average revenue).



Filtering \& Data Quality Checks



HAVING — For post-aggregation filters (negative profit months, above-average revenue groups).



COALESCE / NULL checks — Used in JOIN-based insights (LEFT JOIN screenshots).



Dataset sanity checks — Comparing SUM(Net\_Profit) vs calculations, or checking activity via joins.

---



\# \*\*8. Tools Used\*\*



\* DB Browser for SQLite

\* Excel for preprocessing

\* GitHub for versioning



---





