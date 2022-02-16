DELIMITER //

CREATE DEFINER = 'root'@'localhost' PROCEDURE new_procedure (IN quantityInOrder INT, IN quantityInStock INT)
BEGIN
IF quantityInOrder > quantityInStock THEN
	ROLLBACK;
	END IF;
END

//