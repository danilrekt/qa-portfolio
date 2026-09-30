-- Учебная база: пользователи и заказы

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT,
    age INTEGER,
    city TEXT
);

INSERT INTO users (id, name, email, age, city) VALUES
(1, 'Ivan', 'ivan@mail.com', 25, 'Moscow'),
(2, 'Anna', 'anna@mail.com', 31, 'Kazan'),
(3, 'Petr', 'petr@mail.com', 17, 'Moscow'),
(4, 'Olga', 'olga@mail.com', 42, 'Sochi'),
(5, 'Dmitry', NULL, 28, 'Kazan');

CREATE TABLE orders (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    product TEXT,
    price INTEGER
);

INSERT INTO orders (id, user_id, product, price) VALUES
(1, 1, 'Laptop', 1000),
(2, 1, 'Mouse', 20),
(3, 2, 'Phone', 700),
(4, 4, 'Book', 15),
(5, 99, 'Ghost item', 50);

-- Фильтрация
SELECT name, email FROM users WHERE city = 'Kazan';
SELECT * FROM users WHERE age > 30;
SELECT * FROM users WHERE email IS NULL;
SELECT COUNT(*) FROM users WHERE city = 'Moscow';
SELECT * FROM users WHERE age >= 18 AND city IN ('Moscow', 'Kazan');
SELECT * FROM users WHERE name LIKE '%a';

-- Группировка
SELECT city, COUNT(*) AS total
FROM users
GROUP BY city
ORDER BY total DESC;

-- INNER JOIN: только пользователи с заказами (4 строки)
SELECT users.name, orders.product, orders.price
FROM users
JOIN orders ON users.id = orders.user_id;

-- LEFT JOIN: все пользователи (6 строк)
SELECT users.name, orders.product
FROM users
LEFT JOIN orders ON users.id = orders.user_id;

-- Сумма заказов по пользователям
SELECT users.name, SUM(orders.price) AS total
FROM users
JOIN orders ON users.id = orders.user_id
GROUP BY users.name;

-- Пользователи без заказов
SELECT users.name
FROM users
LEFT JOIN orders ON users.id = orders.user_id
WHERE orders.id IS NULL;

-- Заказы без пользователя (нарушение целостности данных)
SELECT orders.*
FROM orders
LEFT JOIN users ON users.id = orders.user_id
WHERE users.id IS NULL;
