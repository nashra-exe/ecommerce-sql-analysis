-- =============================================================
-- CTE-BASED ANALYSIS
-- =============================================================

-- -- identify the top 10 customers by total_spending 
with customer_spending as 
( select name,sum(price*quantity) as total_spending
from customers c 
join orders o 
on c.customer_id=o.customer_id
join products p 
on p.product_id=o.product_id 
group by name)
select * from customer_spending 
order by total_spending desc 
limit 10;  
-- Identify categories generating more than 500,000 in revenue
with category_revenue as 
( select category, sum(price*quantity) as total_revenue 
from products p 
join orders o 
on p.product_id= o.product_id
group by category )
select * from category_revenue 
where total_revenue> 500000;
-- Analyze monthly revenue across the available years
with revenue as 
( select month(order_date)  as month_ , year(order_date) as year_, sum(price*quantity) as total_revenue
from products p 
join orders o 
on p.product_id=o.product_id
group by month(order_date) , year(order_date))
select * from revenue
order by total_revenue desc;
-- Identify customers whose spending is above the average customer spending
with spending as 
(select name, sum(price*quantity) as total_spending
from customers c 
join orders o 
on c.customer_id= o.customer_id
join products p 
on p.product_id=o.product_id
group by name)
select * from spending 
where total_spending> 
(select avg(total_spending) 
from spending);
-- Identify products generating more than 50,000 in revenue
with product_revenue as 
( select p.product_name, sum(p.price*o.quantity) as revenue 
from products p 
join orders o 
on p.product_id=o.product_id
group by p.product_name)
select * from product_revenue 
where revenue> 50000
order by revenue desc;