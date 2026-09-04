-- =============================================================
-- TRIGGERS
-- =============================================================
DELIMITER // 
CREATE TRIGGER after_order_status_update
after update on orders 
for each row 
BEGIN 
IF old.status <> new.status then 
insert into order_audit 
(order_id, old_status, new_status)
values 
(old.order_id, old.status, new.status);
END IF;
END //
DELIMITER ; 
UPDATE orders 
set status = 'Delivered' 
where order_id=1; 
select * from order_audit;