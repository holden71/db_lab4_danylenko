-- Процедура, що визначає суму, яку витратили на заданий товар:

CREATE OR REPLACE PROCEDURE product_total_spend(p_name varchar(50)) 
LANGUAGE 'plpgsql'
AS $$
DECLARE total_spend  products.product_price%TYPE;

BEGIN
	SELECT SUM(product_price * order_quantity) INTO total_spend
	FROM customers
	JOIN orders USING(customer_steamid) JOIN products USING(product_id)
	WHERE products.product_name = p_name;
    RAISE INFO 'Product name: %,  Total spend: %', p_name, total_spend;
END;
$$;