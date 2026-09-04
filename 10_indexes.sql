-- =============================================================
-- INDEXES 
-- =============================================================

-- Index status 
CREATE INDEX idx_orders_status 
on orders(status);
select * from orders 
where status= 'Delivered';
-- Index order_date 
CREATE INDEX idx_orders_order_date
on orders(order_date);
select * from orders
where order_date >= '2026-01-01';
SHOW INDEX FROM orders;
