create database sqltask;
use sqltask;
CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(100)
);
CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);
CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT,
    status VARCHAR(50),

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);
INSERT INTO customers VALUES
('C101','Rahul','Hyderabad'),
('C102','Priya','Bangalore'),
('C103','Amit','Chennai'),
('C104','Sneha','Mumbai');

INSERT INTO products VALUES
('P101','Laptop',50000),
('P102','Mobile',20000),
('P103','Headphones',2000),
('P104','Keyboard',1500);

INSERT INTO orders VALUES
('O101','C101','P101',1,'Delivered'),
('O102','C102','P102',2,'Delivered'),
('O103','C103','P103',3,'Pending'),
('O104','C101','P104',2,'Delivered');

SELECT o.order_id, c.customer_name, c.city, p.product_name, o.quantity, p.price,
o.status FROM orders o INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN products p ON o.product_id = p.product_id;

SELECT c.customer_name, SUM(o.quantity * p.price) AS total_order_amount FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id INNER JOIN products p ON 
o.product_id = p.product_id GROUP BY c.customer_name;

SELECT status, COUNT(*) AS total_orders FROM orders GROUP BY status;

SELECT p.product_name, SUM(o.quantity * p.price) AS total_sales FROM orders o JOIN 
products p ON o.product_id = p.product_id GROUP BY p.product_name ORDER BY total_sales 
DESC LIMIT 1;

SELECT c.customer_name FROM customers c LEFT JOIN orders o ON c.customer_id = 
o.customer_id WHERE o.customer_id IS NULL;

select * from customers;
select * from products;
select * from orders;
