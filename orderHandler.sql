
-- vi skapar en order
SET autocommit = 0;
START TRANSACTION;

 SELECT @newOrderId := MAX(order_id) +1 FROM orders;
 SELECT @customer := customer_id FROM customerInfo where first_name = "David";
 
 INSERT INTO orders (order_id, order_date, customer_id) VALUES
 (@newOrderId, current_date(), @customer);
 
 SELECT @quantity := stock_status FROM products WHERE product_id = 113;
 
 CALL new_procedure (5, @quantity);
 
 UPDATE products
 SET stock_status = @quantity - 5 WHERE product_id = 113;
 
 SELECT @unitCost := unit_cost  FROM products WHERE product_id = 113;
 
 INSERT INTO orderdetails (order_id, product_id, quantity, unit_sum) VALUES
 (@newOrderId, 113, 5, @unitcost * 5);
 
 SELECT @quantity := stock_status FROM products WHERE product_id = 113;
 
 CALL new_procedure (4, @quantity);
 
 UPDATE products
 SET stock_status = @quantity - 4 WHERE product_id = 114;
 
 SELECT @price := unit_cost FROM products WHERE product_id = 114;
 
 INSERT INTO orderdetails (order_id, product_id, quantity, unit_sum) VALUES
 (@newOrderId, 114, 4, @price * 4);
 
 SELECT @quantity := stock_status FROM products WHERE product_id = 114;
 
 SELECT @totalPrice := SUM(unit_sum) FROM orderdetails WHERE order_id = @newOrderId;
 
 UPDATE orders
 SET total_sum = @totalPrice WHERE order_id = @newOrderId;
 
 
 
COMMIT;
SET autocommit = 1;
