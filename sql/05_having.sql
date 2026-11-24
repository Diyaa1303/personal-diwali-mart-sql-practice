-- Question: Which customers have spent more than 2000 in total?
SELECT c.name,
       SUM(oi.quantity * p.price) AS total_spend
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id
GROUP BY c.customer_id, c.name
HAVING SUM(oi.quantity * p.price) > 1500
ORDER BY total_spend DESC;
