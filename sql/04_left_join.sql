-- Question: How much has each customer spent, including customers with no orders?
SELECT c.name,
       COALESCE(SUM(oi.quantity * p.price), 0) AS total_spend
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.customer_id
LEFT JOIN order_items oi ON oi.order_id = o.order_id
LEFT JOIN products p ON p.product_id = oi.product_id
GROUP BY c.customer_id, c.name
ORDER BY total_spend DESC;
