---- Перевірка функції ----
-- Запит, що повертає назви та кількості проданих товарів
SELECT product_name, SUM(order_quantity) FROM customers JOIN orders USING(customer_steamid) JOIN products USING(product_id) GROUP BY product_name ORDER BY sum DESC;

-- Виклики функції
SELECT sales_count('SCB');
SELECT sales_count('uWeed');
SELECT sales_count('IED');





---- Перевірка процедури ----
-- Запит, що повертає назви, та загальні суми, що були витрачені на товари
SELECT product_name, SUM(product_price * order_quantity) FROM customers JOIN orders USING(customer_steamid) JOIN products USING(product_id) GROUP BY product_name ORDER BY sum DESC;

-- Виклики процедури
CALL product_total_spend('Cyber HUD');
CALL product_total_spend('gProtect');
CALL product_total_spend('SCB');





---- Перевірка тригеру ----
SELECT * FROM Orders;

INSERT INTO Orders VALUES ('000000069', 'STEAM_0:0:7112050', 0003, 7,  TO_DATE('11-07-2021', 'dd-mm-yyyy'));
INSERT INTO Orders VALUES ('000000070', 'STEAM_0:0:9773688', 0001, 7,  TO_DATE('22-07-2021', 'dd-mm-yyyy'));

DELETE FROM Orders where order_id = '000000069';
DELETE FROM Orders where order_id = '000000070';

