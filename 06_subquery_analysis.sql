-- =============================================================
-- SUBQUERIES
-- =============================================================

-- Products priced above the overall average product price 
select price, product_name, product_id from products 
where price > 
( select avg(price) from products);
-- Products priced below the average price of their category 
select p1.product_name, p1.price, p1.category 
from products as p1 
where p1.price < 
(select avg(p2.price) from products as p2
where p1.category=p2.category
group by category);
-- Customers who have placed atleast one order
select name from customers 
where customer_id IN 
( select customer_id from orders);
-- Customers who have never placed an order 
select name from customers 
where customer_id NOT IN 
( select customer_id from orders);
-- Highest priced product(s) 
select * from products 
where price =
(select max(price) from products);
-- Customers with total spending above 100,000
select name 
from customers 
where customer_id in 
( select o.customer_id
from orders o 
join products p 
on p.product_id= o.product_id
group by o.customer_id
having sum(p.price*o.quantity)>100000);