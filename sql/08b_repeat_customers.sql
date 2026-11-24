-- Question: Which customers placed more than one order?
SELECT c.name,
       COUNT(DISTINCT o.order_id) AS order_count,
       SUM(oi.quantity * p.price) AS total_spend
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id
GROUP BY c.customer_id, c.name
HAVING COUNT(DISTINCT o.order_id) > 1;
