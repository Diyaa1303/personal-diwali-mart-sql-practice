-- Creates the Diwali Mart tables and sample data (safe to re-run)
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
  customer_id INTEGER PRIMARY KEY,
  name TEXT, city TEXT, age INTEGER
);
CREATE TABLE products (
  product_id INTEGER PRIMARY KEY,
  product_name TEXT, category TEXT, price REAL
);
CREATE TABLE orders (
  order_id INTEGER PRIMARY KEY,
  customer_id INTEGER, order_date TEXT,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE order_items (
  order_id INTEGER, product_id INTEGER, quantity INTEGER,
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
(1,'Riya','Kolkata',28),(2,'Arjun','Bangalore',34),
(3,'Sneha','Mumbai',25),(4,'Rahul','Delhi',41),(5,'Meera','Chennai',30);

INSERT INTO products VALUES
(1,'Diya Set','Decor',299),(2,'LED Lights','Decor',499),
(3,'Kaju Katli Box','Sweets',650),(4,'Silk Kurta','Fashion',1999),
(5,'Rangoli Kit','Decor',199),(6,'Soan Papdi','Sweets',350);

INSERT INTO orders VALUES
(101,1,'2026-10-20'),(102,2,'2026-10-21'),(103,3,'2026-10-25'),
(104,1,'2026-11-01'),(105,4,'2026-11-02'),(106,5,'2026-11-05');

INSERT INTO order_items VALUES
(101,1,2),(101,3,1),(102,4,1),(103,2,1),(103,5,3),
(104,6,2),(105,3,2),(105,4,1),(106,1,1),(106,6,1);
