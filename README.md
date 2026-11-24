# Diwali Mart: SQL Practice

A small made-up Diwali shopping database (customers, products, orders and order items) that I built to practise SQL, working up from basic filtering to joins, CTEs and window functions.

All data is invented for practice. Nothing here comes from a real company.

## Database

| Table | What it holds |
|---|---|
| `customers` | 5 customers with city and age |
| `products` | 6 products across Decor, Sweets and Fashion |
| `orders` | 6 orders placed between 20 Oct and 5 Nov 2026 |
| `order_items` | 10 order lines linking orders to products, with quantities |

## Queries

Each file in `sql/` answers one business question, with the question written as a comment at the top.

| File | Question | SQL skills |
|---|---|---|
| `00_setup.sql` | Create the tables and load the data (safe to re-run) | `CREATE TABLE`, `INSERT`, `DROP TABLE IF EXISTS` |
| `01_basics.sql` | Which products cost more than ₹400? | `SELECT`, `WHERE`, `ORDER BY` |
| `02_aggregation.sql` | What quantity of each product was sold? | `GROUP BY`, `SUM` |
| `03_joins.sql` | How much revenue did each category earn? | `JOIN` |
| `04_left_join.sql` | How much has each customer spent, including those with no orders? | `LEFT JOIN`, `COALESCE` |
| `05_having.sql` | Which customers spent more than ₹1,500? | `HAVING` |
| `06_cte_monthly.sql` | What was the monthly revenue and the change from the previous month? | CTE, `strftime`, `LAG` |
| `07_window_rank.sql` | How do products rank by revenue within each category? | `RANK() OVER (PARTITION BY ...)` |
| `08a_top_products.sql` | Which 3 products earned the most? | `ORDER BY`, `LIMIT` |
| `08b_repeat_customers.sql` | Which customers ordered more than once? | `COUNT(DISTINCT)`, `HAVING` |

## What the data shows

- Total revenue across all orders was ₹8,991.
- Fashion was the top category (₹3,998), followed by Sweets (₹3,000) and Decor (₹1,993).
- The Silk Kurta was the top product, earning ₹3,998 from 2 units.
- Rahul was the highest-spending customer at ₹3,299. Arjun narrowly missed the ₹2,000 line at ₹1,999.
- Revenue rose from ₹4,343 in October to ₹4,648 in November, an increase of ₹305.
- Riya was the only repeat customer, with 2 orders.

## How to run it

1. Open any SQLite tool, for example [sqliteonline.com](https://sqliteonline.com).
2. Paste in the contents of `sql/00_setup.sql` and run it once.
3. Clear the editor, then paste and run any other query file.

## What I learned

- The difference between `WHERE` (filters rows) and `HAVING` (filters groups).
- Why `LEFT JOIN` keeps customers with no orders, and a plain `JOIN` drops them.
- Why `COUNT(DISTINCT ...)` matters when joins repeat rows.
- How window functions like `LAG` and `RANK` add comparisons without collapsing rows.
