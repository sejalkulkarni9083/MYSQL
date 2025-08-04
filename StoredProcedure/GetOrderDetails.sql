DELIMITER //


CREATE PROCEDURE GetOrderDetails(
    IN p_order_id INT
)
BEGIN


    SELECT o.id AS order_id, o.order_date, o.shipping_address, o.total_amount, oi.item_id, p.name AS product_name, oi.quantity, p.price
    FROM orders o
    JOIN order_items oi ON o.id = oi.order_id
    JOIN products p ON oi.item_id = p.id
    WHERE o.id = p_order_id;


END //


DELIMITER ;
