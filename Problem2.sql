-- Products Table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT
);