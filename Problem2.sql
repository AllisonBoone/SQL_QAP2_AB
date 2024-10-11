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
CREATE TABLE order_item (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)

);