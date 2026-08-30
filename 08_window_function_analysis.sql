-- =============================================================
-- WINDOW FUNCTION ANALYSIS
-- =============================================================

-- Rank products by total revenue
with product_revenue as 
( select p.product_name,p.product_id, sum(p.price*o.quantity) as revenue, rank() over 
( order by sum(p.price*o.quantity) desc) as rank_
from products p 
join orders o 
on p.product_id=o.product_id
group by p.product_name, p.product_id)
select * from product_revenue;
-- Identify the highest-revenue product within each category
with product_revenue  as 
(select product_name,category, sum(price*quantity) as revenue
from products p 
join orders o 
on p.product_id=o.product_id
group by category, product_name),
ranked_products as 
( select *, rank() over 
(partition by category order by revenue desc) as rank_ 
from product_revenue)
select * from ranked_products
where rank_=1;
-- Rank customers by total spending 
select name,  sum(price*quantity) as total_spending, rank () over
( order by sum(price*quantity) desc) as highest_spender
from customers c 
join orders o 
on c.customer_id=o.customer_id
join products p 
on p.product_id=o.product_id 
group by name;
-- Rank customers within their city based on total spending
select name, city, sum(price*quantity) as total_spending, rank () over
(partition by city order by sum(price*quantity) desc) as rank_
from customers c 
join orders o 
on c.customer_id=o.customer_id
join products p 
on p.product_id=o.product_id 
group by name,city;
-- Assign a unique spending rank to customers within each city
select name, city, sum(price*quantity) as total_spending, row_number () over 
(partition by city order by sum(price*quantity) desc) as row_num
from customers c
join orders o 
on c.customer_id= o.customer_id 
join products p 
on p.product_id=o.product_id
group by name, city
order by city, row_num;