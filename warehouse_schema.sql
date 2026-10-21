create database project1_dwh;
GO

use project1_dwh;
GO

-------------- Bronze Schema  ----------------
create schema bronze;
GO

create table bronze.customers
(
 customer_id varchar(50),
 first_name  varchar(50),
 last_name  varchar(50),
 email  varchar(50),
 city varchar(50)
)
create table bronze.products
(
 product_id varchar(50),
 product_name  varchar(50),
 category  varchar(50),
 brand  varchar(50),
 price varchar(50)
)

create table bronze.orders
(
 order_id varchar(50),
 customer_id  varchar(50),
 product_id  varchar(50),
 quantity  varchar(50),
 order_date varchar(50)
)

select * from bronze.customers



-------------- Silver Schema  ----------------
create schema silver;
GO

create table silver.customers
(
 customer_id int,
 full_name  varchar(100),
 email  varchar(50),
 city varchar(50)
)

create table silver.products
(
 product_id int,
 product_name  varchar(50),
 category  varchar(50),
 brand  varchar(50),
 price float
)

create table silver.orders
(
 order_id int,
 customer_id int,
 product_id  int,
 quantity  int,
 order_date date
)

select * from silver.orders

select *
from silver.customers inner join silver.orders
on silver.customers.customer_id = silver.orders.customer_id
inner join  silver.products
on silver.products.product_id = silver.orders.product_id 


-------------- Gold Schema  ----------------
create schema gold;
GO

create table gold.fact
(
 order_id int,
 customer_id int,
 full_name  varchar(100),
 email  varchar(50),
 city varchar(50) ,
 product_id  int,
 product_name  varchar(50),
 category  varchar(50),
 brand  varchar(50),
 order_date date,
 quantity  int,
 price float,
 total_amount float
)


select * from gold.fact

