SELECT education, COUNT(*) AS cnt FROM Clusters 
	GROUP BY education 
	ORDER BY cnt DESC;

SELECT  sex, is_client, COUNT(*) AS cnt FROM Clusters c  
GROUP BY sex , is_client 
ORDER BY sex DESC , is_client;

SELECT  education , is_client, COUNT(*) AS cnt FROM Clusters c  
GROUP BY education , is_client 
ORDER BY education DESC , is_client;

SELECT  education , sex , COUNT(*) AS cnt FROM Clusters  
WHERE  is_client = 1
GROUP BY education , sex 
HAVING cnt < 40
ORDER BY cnt DESC;

SELECT sex, education, AVG(credit_amount) as 'sr velichina credita',AVG(income) as 'sr dohod' FROM Clusters c 
WHERE  is_client = 1
GROUP BY education, sex
ORDER BY education, sex;


SELECT  sex, bad_client_target, MIN(credit_amount) AS 'MIN CREDIT',MAX(credit_amount) AS 'MIN CREDIT' FROM Clusters  
WHERE education LIKE '%higher%'
GROUP BY sex, bad_client_target
ORDER  BY sex,bad_client_target;


SELECT MIN(age), MAX(age),AVG(age),sex,phone_operator FROM Clusters c 
GROUP BY sex , phone_operator 
ORDER BY phone_operator,sex;

SELECT  cluster, COUNT(*) AS cnt FROM Clusters c
GROUP BY cluster 
ORDER  BY cnt DESC;

SELECT MAX(cluster) FROM Clusters c; 


SELECT (CASE WHEN cluster IN (1,5,6,2) THEN -1 ELSE cluster END) AS 'new_cluster',
COUNT(*) AS cnt,
AVG(age),AVG(income),AVG(credit_amount),sex
FROM Clusters  
GROUP BY new_cluster
ORDER BY cnt;

SELECT region, AVG(income) AS 'avg_income' From Clusters 
GROUP BY region 
ORDER BY avg_income DESC;


SELECT *FROM Orders 
WHERE  OrderID  IN (SELECT OrderID FROM OrderDetails 
WHERE ProductID IN (SELECT ProductID FROM Products 
WHERE categoryID IN (4,6)));


SELECT  DISTINCT  country FROM Customers 
WHERE CustomerID IN (SELECT CustomerID FROM Orders 
WHERE shipperID IN (SELECT shipperID FROM Shippers 
WHERE shipperName = 'Speedy_Express'));


SELECT City ,Country , COUNT(*)AS cnt FROM Customers 
WHERE  Country  IN (SELECT country FROM Customers 
GROUP BY Country 
ORDER BY COUNT(*) DESC 
LIMIT 3)
GROUP BY City ,Country 
ORDER BY cnt DESC
LIMIT 3;


/*Описание: Вам необходимо проверить, как различные категории продуктов влияют на
общий доход (общую сумму заказов) в таблице OrderDetails. Подсчитайте общее
количество заказов (сумму количества) и общий доход (сумму количества * цену) для
каждой категории продуктов. Выведите результаты, включая:
● CategoryID
● Общее количество заказов (total_quantity)
● Общий доход (total_revenue)
Отсортируйте результаты по убыванию общего дохода (total_revenue). Используйте
таблицы Products, OrderDetails и Categories.*/

SELECT p.CategoryID, SUM(od.Quantity) AS total_quantity, SUM(od.Quantity * p.Price) AS total_revenue FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.CategoryID
ORDER BY total_revenue DESC;



/*Описание: Напишите запрос SQL для подсчета количества заказов продуктов по
каждой категории. Подсчитайте количество уникальных заказов (OrderID) для каждой
категории продуктов. Выведите результаты, включая:
● CategoryID
● Количество уникальных заказов (order_count)
Отсортируйте результаты по убыванию количества уникальных заказов
(order_count). Используйте таблицы Products, OrderDetails и Categories.*/

SELECT p.CategoryID, COUNT(DISTINCT od.OrderID) AS order_count FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.CategoryID
ORDER BY order_count DESC;

/*Описание: Выведите список продуктов (название ProductName), отсортированных по
количеству заказов в порядке убывания. Подсчитайте общее количество заказов
(Quantity) для каждого продукта. Выведите результаты, включая:
● ProductName
● Общее количество заказов (total_quantity)
Отсортируйте результаты по убыванию общего количества заказов (total_quantity).
Используйте таблицы Products и OrderDetails.*/
SELECT p.ProductName, SUM(od.Quantity) AS total_quantity FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY total_quantity DESC;

