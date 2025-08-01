DELIMITER //

CREATE PROCEDURE LowStockAlert(
    IN p_threshold INT
)
BEGIN
    SELECT id, name, stock
    FROM products
    WHERE stock < p_threshold;
END //

DELIMITER ;

CALL LowStockAlert(10);