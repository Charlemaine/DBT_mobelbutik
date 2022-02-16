DELIMITER //

CREATE PROCEDURE PlaceOrder (
IN customer VARCHAR(50),
IN products VARCHAR (50),
IN quantitiesAsString VARCHAR(50)
)


BEGIN
	SELECT @totalNumberOfProducts := LENGTH(products) - LENGTH(REPLACE(products, ',', ' '))+ 1;
	SET @currentCount := 1;
    
    SELECT @newOrderId := MAX(order_id) + 1 FROM orders;
	SELECT @customer := customer_id FROM customerInfo where first_name  = customer;
    
    START TRANSACTION;
    
    INSERT INTO orders (order_id, order_date, customer_id) 
    VALUES (@newOrderId, current_date(), @customer);
    
    -- start loop for order details
	WHILE @currentCount <= @totalNumberOfProducts DO

		SET @product := SUBSTRING_INDEX(SUBSTRING_INDEX(products,",", @currentCount),",", -1);
        SET @quantity := SUBSTRING_INDEX(SUBSTRING_INDEX(quantitiesAsString,",", @currentCount),",", -1);
        
        SELECT @productId := product_id FROM products WHERE product_name = @product;
        SELECT @unitCost := unit_cost FROM products WHERE product_name = @product;
        SELECT @quantityInStock := stock_status FROM products WHERE product_name = @product;
        
        CALL new_procedure(CAST(@quantity AS UNSIGNED), @quantityInStock );
        UPDATE products
		SET stock_status = stock_status - CAST(@quantity AS UNSIGNED) WHERE product_id = @productId;
        
        INSERT INTO orderdetails(order_id,product_id,quantity, total_sum) 
        VALUES (@newOrderId, @productId, CAST(@quantity AS UNSIGNED), CAST(@quantity AS UNSIGNED) * @unitCost);
        
        
    SET @currentCount = @currentCount + 1;
    END WHILE;


    
-- lägg till total payments i order
	SELECT @totalSum := SUM(unit_cost) FROM orderdetails WHERE order_id = @newOrderId;
 
	UPDATE orders
	SET total_payment = @totalSum WHERE order_id = @newOrderId;

	COMMIT;
END
//
DELIMITER ;
