-- =============================================================
-- STORED FUNCTIONS
-- =============================================================

DELIMITER //
CREATE FUNCTION customer_total_spending(customerId INT) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN 
DECLARE total_spending decimal(10,2);
select sum(p.price*o.quantity)
into total_spending 
from orders o 
join products p 
on o.product_id=p.product_id
where o.customer_id=customerId;
return total_spending ; 
END //
DELIMITER ;
SELECT customer_id, name, customer_total_spending(customer_id) as total_spending 
from customers;