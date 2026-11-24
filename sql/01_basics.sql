-- Question: Which products cost more than ₹400, from most to least expensive?
SELECT product_name, price
FROM products
WHERE price > 400
ORDER BY price DESC;
