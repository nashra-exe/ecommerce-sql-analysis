-- =============================================================
-- VIEWS 
-- =============================================================

-- Calculate revenue by city using a view 
create view order_detail as 
select o.order_id, c.name, c.city, p.product_name, p.category, p.price, 
o.quantity, o.order_date, o.status
from customers c  
join orders o 
on o.customer_id= c.customer_id
join products p 
on o.product_id= p.product_id;
select city, sum(price*quantity) as total_revenue 
from order_detail
group by city
order by total_revenue desc; 
-- Products with high order quantities
select product_name, quantity
from order_detail
where quantity>5;