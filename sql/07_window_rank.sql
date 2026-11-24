-- Question: How do products rank by revenue within their category?
SELECT p.category,
       p.product_name,
       SUM(oi.quantity * p.price) AS revenue,
       RANK() OVER (
         PARTITION BY p.category
         ORDER BY SUM(oi.quantity * p.price) DESC
       ) AS rank_in_category
FROM order_items oi
JOIN products p ON p.product_id = oi.product_id
GROUP BY p.product_id, p.category, p.product_name
ORDER BY p.category, rank_in_category;
