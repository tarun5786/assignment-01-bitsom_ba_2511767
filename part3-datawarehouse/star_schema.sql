create database if not exists star_schema;
use star_schema;

-- creating date dimension table
Create table if not exists dim_date(
date_id Int Auto_increment Primary key,
date_ date,
day_ int generated always as (day(date_)) stored,
month_ int generated always as (month(date_)) stored,
year_ int generated always as (year(date_)) stored,
quarter_ int generated always as (quarter(date_)) stored
);

-- creating store dimension table
create table if not exists dim_store(
store_id int auto_increment primary key,
store_name varchar(100),
store_city varchar(50)
);

-- creating product dimension table
create table if not exists dim_product(
product_id int auto_increment primary key,
product_name varchar(150),
category varchar(100),
unit_price decimal(10,2)
);

-- creating fact_sales fact-table
create table if not exists fact_sales(
transaction_id varchar(100) primary key,
store_id int,
customer_id varchar(100),
product_id int,
date_id int,
units_sold int,
unit_price decimal(10,2),
constraint fk_store_id
foreign key (store_id) references dim_store (store_id),
constraint fk_product_id
foreign key (product_id) references dim_product(product_id),
constraint fk_date_id 
foreign key (date_id) references dim_date (date_id)
);

-- Inserting Transformed values to tables
insert into dim_store (store_name, store_city) values
("Chennai Anna", "Chennai"),
("Delhi South", "Delhi"),
("Bangalore MG", "Bangalore"),
("Pune FC Road", "Pune"),
("Mumbai Central", "Mumbai");

insert into dim_product (product_name, category, unit_price) values
("Speaker", "Electronics", 49262.78),
("Atta 10kg", "Groceries", 52464),
("Jeans", "Clothing", 2317.47),
("Phone", "Electronics", 48703.39),
("Biscuits", "Groceries", 27469.99),
("Saree", "Clothing", 35451.81),
("Headphones", "Electronics", 39854.96),
("Rice 5kg", "Groceries", 52195.05),
("T-Shirt", "Clothing", 29770.19),
("Smartwatch", "Electronics", 58851.01),
("Jacket", "Clothing", 30187.24),
("Laptop", "Electronics", 42343.15),
("Tablet", "Electronics", 23226.12);

insert into dim_date (date_) values
("2023-08-29"),
("2023-12-12"),
("2023-02-05"),
("2023-02-20"),
("2023-01-15"),
("2023-08-09"),
("2023-03-31"),
("2023-10-26"),
("2023-12-08"),
("2023-08-15"),
("2023-06-04");

insert into fact_sales (transaction_id, store_id, customer_id, product_id, date_id, units_sold, unit_price) values
("TXN5000", 1, "CUST045", 1, 1,3, 49262.78),
("TXN5001", 1, "CUST021", 13, 2, 11,23226.12),
("TXN5002", 1, "CUST019", 4, 3, 20, 48703.39),
("TXN5003", 2, "CUST007", 13, 4, 14, 23226.12),
("TXN5004", 1, "CUST004", 10, 5, 10, 58851),
("TXN5005", 3, "CUST027", 2, 6, 12, 52464),
("TXN5006", 4, "CUST025", 10,  7, 6, 58851),
("TXN5007", 4, "CUST041", 3, 8, 16, 2317.47),
("TXN5008", 3, "CUST030", 5, 9, 9, 27470),
("TXN5009", 3, "CUST020", 10, 10, 3, 58851);






