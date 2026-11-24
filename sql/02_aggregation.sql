-- Question: What is the total quantity sold for each product?
SELECT product_id, SUM(quantity) AS total_quantity
FROM order_items
GROUP BY product_id;
