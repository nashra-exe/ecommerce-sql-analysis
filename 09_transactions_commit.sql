-- =============================================================
-- TRANSACTION & COMMIT 
-- =============================================================

-- Rollback _undo an uncomitted change 
START TRANSACTION; 
delete from orders 
where order_id=1;
select * from orders
where order_id=1;
ROLLBACK;
select * from orders
where order_id=1;
-- Commit _permanently save an update
START TRANSACTION;
update orders
set status='Cancelled' 
where order_id=2;
select * from orders where order_id=2; 
ROLLBACK;  
update orders 
set status= 'Cancelled'
where order_id= 1;  
COMMIT;
select * from orders 
where order_id= 1;