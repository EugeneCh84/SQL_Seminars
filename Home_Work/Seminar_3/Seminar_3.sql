CREATE TABLE staff (
	id SERIAL PRIMARY KEY,
    firstname VARCHAR (50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    post VARCHAR(25) NOT NULL,
    seniority INT NOT NULL,
    salary INT NOT NULL,
    age INT NOT NULL);
    
INSERT INTO staff (firstname, lastname, post, seniority, salary, age) VALUE 
	('Вася', 'Петров', 'Начальник', 40, 100000, 60),
    ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
    ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
    ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
    ('Иван', 'Иванов', 'Рабочий', 40, 30000, 59),
    ('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
    ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
    ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
    ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
    ('Максим', 'Максимов', 'Рабочий', 2, 11000, 22),
    ('Юрий', 'Галкин', 'Рабочий', 3, 12000, 24),
    ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
    

/*Task 1*/
SELECT * FROM staff
ORDER BY salary ASC;

SELECT * FROM staff
ORDER BY salary DESC;

/*Task 2*/
SELECT * FROM staff
ORDER BY salary DESC
LIMIT 5;

/*Task 3*/
SELECT post, SUM(salary) FROM staff
GROUP BY post ;

/*Task 4*/
SELECT post, COUNT(*) FROM staff
WHERE post='Рабочий' AND age BETWEEN 24 AND 49;


/*Task 5*/
SELECT COUNT(DISTINCT post) AS UNIQUE_POST  FROM staff;


/*Task 6*/
SELECT post FROM staff
GROUP BY post
HAVING AVG(age)<30;
/* По такому условию записей нет*/

