DELIMITER //

CREATE PROCEDURE AddProductReview(
    IN p_product_id INT,
    IN p_user_id INT,
    IN p_rating INT,
    IN p_review TEXT
)
BEGIN
    INSERT INTO reviews (product_id, user_id, rating, review_text)
    VALUES (p_product_id, p_user_id, p_rating, p_review);
END //

DELIMITER ;

CALL AddProductReview(1, 2, 5, 'Great product!');