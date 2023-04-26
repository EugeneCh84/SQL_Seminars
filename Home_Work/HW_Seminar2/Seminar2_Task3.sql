USE seminar2;

CREATE TABLE orders (
id SERIAL PRIMARY KEY,
employee_id VARCHAR(10) NOT NULL,
amount DECIMAL(6,2) NOT NULL,
opder_status VARCHAR(15));


INSERT INTO orders (employee_id, amount, opder_status) VALUES 
('e04', 12.30, 'OPEN'),
('e07', 143.00, 'OPEN'),
('e41', 56.99, 'CLOSED'),
('e24', 312.10, 'CANCELLED'),
('e83', 112.50, 'OPEN'),
('e21', 8.70, 'CLOSED'),
('e11', 73.20, 'CANCELLED'),
('e01', 32.34, 'OPEN');



SELECT *,
IF (opder_status='OPEN', 'Order is in open state',
	IF (opder_status='CLOSED', 'Order is closed',
		IF (opder_status='CANCELLED', 'Order is cancelled', '')
	)
) AS 'Ful order status'
FROM orders;