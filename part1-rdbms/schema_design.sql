-- Initializing retail_orders database
CREATE DATABASE IF NOT EXISTS retail_store;
USE retail_store;

-- Creating customers table
CREATE TABLE IF NOT EXISTS customers (
    customer_id CHAR(8) PRIMARY KEY,
    customer_name VARCHAR(35) NOT NULL,
    customer_email VARCHAR(150) NOT NULL,
    customer_city VARCHAR(30) NOT NULL
);

-- Creating product category table
CREATE TABLE IF NOT EXISTS product_type (
    product_cat_id INT AUTO_INCREMENT PRIMARY KEY,
    product_cat VARCHAR(150)
);

-- Creating table for products 
CREATE TABLE IF NOT EXISTS products (
    product_id CHAR(8) PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    product_cat_id INT,
    unit_price DECIMAL(10 , 2 ) NOT NULL,
    CONSTRAINT fk_product_category FOREIGN KEY (product_cat_id)
        REFERENCES product_type (product_cat_id)
);

-- Creating Table for employees 
CREATE TABLE IF NOT EXISTS employees (
    sales_rep_id CHAR(8) PRIMARY KEY,
    sales_rep_name VARCHAR(35) NOT NULL,
    sales_rep_email VARCHAR(150) NOT NULL,
    office_address TEXT
);

-- Craeating table for orders placed by customers
CREATE TABLE orders_placed (
    order_id VARCHAR(50) PRIMARY KEY,
    order_date DATE,
    sales_rep_id CHAR(8),
    customer_id CHAR(8),
    product_id CHAR(8),
    quantity INT,
    CONSTRAINT fk_sales_representative FOREIGN KEY (sales_rep_id)
        REFERENCES employees (sales_rep_id),
    CONSTRAINT fk_customer_id FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id),
    CONSTRAINT fk_product_id FOREIGN KEY (product_id)
        REFERENCES products (product_id)
);


-- adding  customers to customers table
INSERT INTO customers(customer_id,customer_name,customer_email,customer_city) VALUES 
	("C001", "Rohan Mehta", "rohan@gmail.com", "Mumbai"),
    ("C002", "Priya Sharma", "priya@gmail.com", "Delhi"),
    ("C003", "Amit Verma", "amit@gmail.com", "Bangalore"),
    ("C004", "Sneha Iyer", "sneha@gmail.com", "Chennai"),
    ("C005", "Vikram Singh", "vikram@gmail.com", "Mumbai"),
    ("C006", "Neha Gupta", "neha@gmail.com", "Delhi"),
    ("C007", "Arjun Nair", "arjun@gmail.com", "Bangalore"),
    ("C008", "Kavya Rao", "kavya@gmail.com", "Hyderabad");
    
-- adding employee details to the employee table
INSERT INTO employees(sales_rep_id,sales_rep_name,sales_rep_email,office_address) VALUES
	("SR01", "Deepak Joshi",  "deepak@corp.com", "Mumbai HQ, Nariman Point, Mumbai - 400021"),
    ("SR02", "Anita Desai", "anita@corp.com", "Delhi Office, Connaught Place, New Delhi - 110001"),
    ("SR03", "Ravi Kumar", "ravi@corp.com", "South Zone, MG Road, Bangalore - 560001");
    
-- adding categories to product type table
INSERT INTO product_type(product_cat) VALUES
	("Stationery"),
    ("Electronics"),
    ("Furniture");
    
-- adding products, price to the products table
INSERT INTO products(product_id,product_name,product_cat_id,unit_price) VALUES
	("P001", "Laptop", 2, 55000),
    ("P002", "Mouse", 2, 800),
    ("P003", "Desk Chair", 3, 8500),
    ("P004", "Notebook", 1, 120),
    ("P005", "Headphones", 2, 3200),
    ("P006", "Standing Desk", 3, 22000),
    ("P007", "Pen Set", 1, 250);
    
-- adding orders to the Orders_placed table
INSERT INTO orders_placed(order_id,customer_id,product_id,order_date,sales_rep_id,quantity) VALUES
	("ORD1027", "C002", "P004", "2023-11-02", "SR02", 4),
    ("ORD1114", "C001", "P007", "2023-08-06", "SR01", 2),
    ("ORD1153", "C006", "P007", "2023-02-14", "SR01", 3),
    ("ORD1002", "C002", "P005", "2023-01-17", "SR02", 1),
    ("ORD1118", "C006", "P007", "2023-11-10", "SR02", 5),
    ("ORD1132", "C003", "P007", "2023-03-07", "SR02", 5),
    ("ORD1037", "C002", "P007", "2023-03-06", "SR03", 2);
    
-- adding new employee details to employees table
INSERT INTO employees(sales_rep_id,sales_rep_name,sales_rep_email,office_address) VALUES
	("SR04", "Abhiram Palle",  "palle@corp.com", "Mumbai HQ, Nariman Point, Mumbai - 400021"),
    ("SR05", "Arun Kumar", "arun@corp.com", "South Zone, MG Road, Bangalore - 560001");
    
-- adding new product category to product_type table 
INSERT INTO product_type(product_cat) VALUES
	("Food"),
    ("Apparel & Accessories");




