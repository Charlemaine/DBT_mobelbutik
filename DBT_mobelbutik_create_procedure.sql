DELIMITER //
-- DROP PROCEDURE IF EXISTS PlaceOrder;

CREATE PROCEDURE PlaceOrder (
IN customerName VARCHAR(50),
IN products VARCHAR (50),
IN quantitiesAsString VARCHAR(50)
)


BEGIN
	SELECT @totalNumberOfProducts := LENGTH(products) - LENGTH(REPLACE(products, ',', ''))+ 1;
	SET @currentCount := 1;
    
    SELECT @newOrderId := MAX(order_id) + 1 FROM orders;
	SELECT @customer := customer_id FROM customers where customer_name = customerName;
    
    START TRANSACTION;
    
    INSERT INTO orders (order_id, order_date, customer_id) 
    VALUES (@newOrderId, current_date(), @customer);
    
    -- start loop for order details
	WHILE @currentCount <= @totalNumberOfProducts DO

		SET @product := SUBSTRING_INDEX(SUBSTRING_INDEX(products,",", @currentCount),",", -1);
        SET @quantity := SUBSTRING_INDEX(SUBSTRING_INDEX(quantitiesAsString,",", @currentCount),",", -1);
        
        SELECT @productId := product_id FROM products WHERE product_name = @product;
        SELECT @cost := cost FROM products WHERE product_name = @product;
        SELECT @quantityInStock := quantity_in_stock FROM products WHERE product_name = @product;
        
        CALL new_procedure(CAST(@quantity AS UNSIGNED), @quantityInStock );
        UPDATE products
		SET stock_status = stock_status - CAST(@quantity AS UNSIGNED) WHERE product_id = @productId;
        
        INSERT INTO orderdetails(order_id,product_id,quantity, total_sum) 
        VALUES (@newOrderId, @productId, CAST(@quantity AS UNSIGNED), CAST(@quantity AS UNSIGNED) * @price);
        
        
    SET @currentCount = @currentCount + 1;
    END WHILE;


    
-- lägg till total payments i order
	SELECT @totalPrice := SUM(price_per_product) FROM orderdetails WHERE order_id = @newOrderId;
 
	UPDATE orders
	SET total_payment = @totalPrice WHERE order_id = @newOrderId;

	COMMIT;
END
//
DELIMITER ;
