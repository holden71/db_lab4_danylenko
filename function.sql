-- Функція, що визначає кількість проданих одиниць товару за його назвою.

CREATE OR REPLACE FUNCTION sales_count(p_name text) RETURNS int AS
$$
    DECLARE
        counter_of_sales integer;
    BEGIN
        SELECT SUM(order_quantity) INTO counter_of_sales
        FROM customers
        JOIN orders USING(customer_steamid) JOIN products USING(product_id)
        WHERE products.product_name = p_name;
        
        RETURN counter_of_sales;
    END;
$$ LANGUAGE 'plpgsql';