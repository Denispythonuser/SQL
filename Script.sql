--1.Определите, сколько уникальных стран представлено среди клиентов.
SELECT COUNT(DISTINCT Country) AS unique_countries
FROM Customers;
--21

--2.Определите количество клиентов, которые проживают в Бразилии.
SELECT COUNT(*) AS brazil_customers
FROM Customers
WHERE Country = 'Brazil';
--9


--3.Посчитайте среднюю цену и общее количество товаров в категории с идентификатором 5.
SELECT
AVG(Price) AS avg_price,
COUNT(*) AS total_products
FROM Products
WHERE CategoryID = 5;
--20.25--7

--4.Вычислите средний возраст сотрудников на дату 2024-01-01.
SELECT AVG((JULIANDAY('2024-01-01') - JULIANDAY(BirthDate)) / 365.25) AS average_age
FROM employees;
--66.1

--5.Найдите заказы, сделанные в период с 16 января по 15 февраля 2024 года, и отсортируйте их по дате заказа.
SELECT *
FROM Orders
WHERE OrderDate BETWEEN '2024-01-16' AND '2024-02-15'
ORDER BY OrderDate;
--28

--6.Определите количество заказов, сделанных в ноябре 2023 года, используя начальную и конечную дату месяца.
SELECT COUNT(*) AS november_orders
FROM Orders
WHERE OrderDate >= '2023-11-01' AND OrderDate <= '2023-11-30';
--25

--7.Найдите количество заказов за январь 2024 года, используя оператор LIKE для фильтрации даты.
SELECT COUNT(*) AS january_orders
FROM Orders
WHERE OrderDate LIKE '2024-01%';
--33

--8.Определите количество заказов за 2024 года, используя функцию STRFTIME для извлечения года.
SELECT COUNT(*) AS total_orders
FROM orders
WHERE STRFTIME('%Y', OrderDate) = '2024';
--44


