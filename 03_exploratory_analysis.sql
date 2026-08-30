-- =============================================================
-- Exploratory Analysis
-- =============================================================

-- Identify the highest-priced products in the catalog
select product_name, category, price 
from products
order by price desc 
limit 10;
-- Cuatomers located in Delhi 
select name, email, city 
from customers
where city= "Delhi";
-- Explore the unique product categories 
select distinct category from products;
-- Most recent delivered orders 
select * from orders
where status= 'Delivered'
order by order_date desc
limit 10;
-- Explore products within a specific price range 
select * from products 
where price between 500 and 2000
order by price asc;
-- Customers across selected cities 
select city, name from customers 
where city in ('Delhi', 'Lucknow', 'Mumbai');
-- Large orders 
select customer_id, quantity 
from orders
where quantity > 5;
-- Orders that are placed during 2026 
select * from orders
where order_date between '2026-01-01' and '2026-12-31';
-- Details of cancelled and returned orders
select * from orders 
where status in ( 'Cancelled', 'Returned');
-- High priced electronics products 
select * from products
where category = "Electronics" and price > 5000;