-- Створення тригеру, котрий встановлює актуальну дату для кожного нового замовлення.

CREATE OR REPLACE FUNCTION order_date_insert() RETURNS trigger AS
$$
	BEGIN
		UPDATE orders
		SET order_date = CURRENT_DATE 
		WHERE orders.order_date IS NULL OR orders.order_date = NEW.order_date;
		RETURN NULL;
	END;
$$ LANGUAGE 'plpgsql';


CREATE TRIGGER auto_order_date_insert
AFTER INSERT ON orders
FOR EACH ROW
EXECUTE FUNCTION order_date_insert();
