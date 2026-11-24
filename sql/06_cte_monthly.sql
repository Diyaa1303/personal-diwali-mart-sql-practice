-- Question: What was the revenue each month, and how much did it change from the previous month?
WITH monthly AS (
  SELECT strftime('%Y-%m', o.order_date) AS month,
         SUM(oi.quantity * p.price) AS revenue
  FROM orders o
  JOIN order_items oi ON oi.order_id = o.order_id
  JOIN products p ON p.product_id = oi.product_id
  GROUP BY strftime('%Y-%m', o.order_date)
)
SELECT month,
       revenue,
       revenue - LAG(revenue) OVER (ORDER BY month) AS change_from_previous
FROM monthly
ORDER BY month;
