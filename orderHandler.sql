

-- Bill vill beställa 5 apelsiner och 4 bananer


-- vi skapar en order
SET autocommit = 0;
START TRANSACTION;

 SELECT @newOrderId := MAX(order_id) +1 FROM orders;
 SELECT @customer := customer_id FROM customerInfo where first_name = "David";
 
 INSERT INTO orders (order_id, order_date, total_sum) VALUES
 (@newOrderId, current_date(), @customer);
 
 SELECT @quantity := stock_status FROM products WHERE product_id = 113;
 
 CALL PlaceOrder (@customer, @quantity, );
 
 UPDATE products
 SET stock_status = @quantity - 5 WHERE product_id = 113;
 
 SELECT @unitCost := unit_cost  FROM products WHERE product_id = 113;
 
 INSERT INTO orderdetails (order_id, product_id, quantity, price_per_product) VALUES
 (@newOrderId, 113, 5, @unit_cost * 5);
 
 SELECT @quantity := stock_status FROM products WHERE product_id = 113;
 
 CALL new_procedure (4, @quantity);
 
 UPDATE products
 SET stock_status = @quantity - 4 WHERE product_id = 114;
 
 SELECT @price := unit_cost FROM products WHERE product_id = 114;
 
 INSERT INTO orderdetails (order_id, product_id, quantity, price_per_product) VALUES
 (@newOrderId, 114, 4, @price * 4);
 
 SELECT @totalPrice := SUM(price_per_product) FROM orderdetails WHERE order_id = @newOrderId;
 
 UPDATE orders
 SET total_payment = @totalPrice WHERE order_id = @newOrderId;
 
 
 
COMMIT;
SET autocommit = 1;
