-- Products Table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT
);

-- Customers Table
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name varchar(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);

--Orders Table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(id)

);

-- Order_items Table
CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)

);

-- Insert products table data
INSERT INTO products (product_name, price, stock_quantity) VALUES
('Desktop', 899.99, 50),
('Laptop', 399.99, 10),
('IPad', 89.99, 100),
('Smartphone', 599.99, 15),
('Smartwatch', 299.99, 20);

-- Insert customers table data
INSERT INTO customers (first_name, last_name, email) VALUES
('John', 'Doe', 'JohnDoe@email.com'),
('Jane', 'Smith', 'JaneSmith@email.com'),
('Bob', 'Doyle', 'BobDoyle@email.com'),
('Mark', 'Delaney', 'MarkDelaney@email.com');

-- Insert orders table data
INSERT INTO orders (customer_id, order_date) VALUES
(1, '2024-01-01'),
(2, '2024-02-02'),
(3, '2024-03-03'),
(4, '2024-04-04'),
(3, '2024-04-04');

-- Insert order_items table data
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 5), 
(2, 2, 4),  
(3, 3, 3),  
(4, 4, 2),  
(5, 5, 3); 

-- Query names and quantity of all products
SELECT product_name, stock_quantity 
FROM products;

-- Query name and quantity of order with id 1
SELECT products.product_name. order_items.quantity 
FROM order_items
JOIN products ON order_items.product_id = products.id
WHERE order_items.order_id = 1;

-- Query all orders made by a customer with id 1
SELECT orders.id AS order_id, products.product_name, order_items.quantity
FROM orders
JOIN order_items ON orders.id = order_items.order_id
JOIN products ON order_items.product_id = products.id 
WHERE orders.customer_id = 1;

-- Query stock quantity of order id 5 (Smartwatch)
SELECT products.products_name, products.stock_quantity
FROM products
JOIN order_items ON products.id = order_items.product.id
WHERE order_items.order_id = 5;

-- Update stock quantity (-3 to Smartwatch stock of 20)
UPDATE products 
SET stock_quantity = stock_quantity - order_items.quantity
FROM order_items
WHERE products.id = order_items.products_id
AND order_items.order_id = 5;

-- Delete items from order
DELETE FROM order_items
WHERE order_id = 3;

-- Delete order with deleted items
DELETE FROM orders
WHERE id = 3;
