USE seminar2;

CREATE TABLE sales (
id SERIAL PRIMARY KEY,
order_date DATE NOT NULL,
count_product BIGINT UNSIGNED NOT NULL);

INSERT INTO sales (order_date, count_product) VALUES 
('2023-05-13', 184),
('2022-02-25', 32),
('2021-11-04', 251),
('2022-12-14', 397),
('2023-04-11', 122),
('2021-06-27', 557),
('2022-01-19', 27),
('2023-05-09', 137),
('2022-11-24', 74);


SELECT 
id AS 'id_заказа',
CASE 
	WHEN count_product<100 THEN 'Маленький заказ'
    WHEN count_product BETWEEN 100 AND 300 THEN 'Средний заказ'
	WHEN count_product>300 THEN 'Большой заказ'
END AS 'Тип заказа'
FROM sales;
    