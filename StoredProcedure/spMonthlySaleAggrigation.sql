DELIMITER //

CREATE PROCEDURE MonthlySalesReport(
    IN p_year INT,
    IN p_month INT
)
BEGIN
    SELECT p.id AS product_id, p.name AS product_name,
           SUM(oi.quantity) AS total_quantity_sold,
           SUM(oi.quantity * p.price) AS total_sales
    FROM orders o
    JOIN order_items oi ON o.id = oi.order_id
    JOIN products p ON oi.item_id = p.id
    WHERE YEAR(o.order_date) = p_year AND MONTH(o.order_date) = p_month
    GROUP BY p.id, p.name;
END //

DELIMITER ;

CALL MonthlySalesReport(2024, 8);