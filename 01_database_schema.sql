create database ecommerce_db;
use ecommerce_db;
-- Tables: 
create table customers(
customer_id INT primary key,
name varchar(50) not null, 
city varchar(50),
email varchar(100) not null unique
); 
create table products (
product_id int primary key, 
product_name varchar(100) not null,
category varchar(50) not null, 
price decimal(10, 2) not null,
stock_quantity int not null check( stock_quantity>0)
);
create table orders( 
order_id int primary key, 
customer_id int not null, 
product_id int not null, 
quantity int not null check(quantity>0),
order_date date not null, 
status varchar(20) default 'pending' ,
foreign key (customer_id) references customers(customer_id),
foreign key (product_id) references products(product_id)
);