DELIMITER //

CREATE PROCEDURE LoginUser(
IN p_username VARCHAR(50),
 IN p_password VARCHAR(255)
)
BEGIN
 SELECT id, username, email
 FROM users
 WHERE username = p_username AND password = p_password;
END //

DELIMITER ;