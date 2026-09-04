-- =============================================================
-- STORED PROCEDURE 
-- =============================================================
DELIMITER // 
CREATE PROCEDURE get_customer_order_details(in customerId int)
BEGIN
select o.order_id, c.name, c.city, p.product_name, p.category, p.price, 
o.quantity, o.order_date, o.status
from customers c  
join orders o 
on o.customer_id= c.customer_id
join products p 
on o.product_id= p.product_id
where o.customer_id= customerId; 
END // 
DELIMITER ;
CALL get_customer_order_details(1);