-- =============================================================
-- DATA VALIDATION 
-- =============================================================
-- check the number of records in each table 
select count(*) from customers;
select count(*) from products;
select count(*) from orders;
-- check for cutomers with missing emails
select * from customers 
where email is NULL;
-- check for duplicate customer emails
select email, count(*) as duplicate_emails 
from customers 
group by email 
having count(*)>1;
-- products with invalid or non-positive prices
select * from products 
where price <= 0; 
-- orders with invalid or non-positive quantities
select  * from orders
where quantity<= 0;
-- orders containing unexpected status values
select * from orders
where status not in ('Delivered', 'Pending', 'Cancelled', 'Returned');
--  orders referencing non-existent customers
select o. * 
from orders o 
left join customers c 
on o.customer_id= c.customer_id
where c.customer_id is null;