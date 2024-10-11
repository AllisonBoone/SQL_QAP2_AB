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
(1, 3, '2024-01-01'),
(2, 2, '2024-02-02'),
(3, 1, '2024-03-03'),
(4, 2, '2024-04-04'),
(3, 3, '2024-04-04');


