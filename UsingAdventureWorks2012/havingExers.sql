--udemy
--Microsoft SQL for Beginners - Brewster Knowlton

use AdventureWorks2012

--HAVING Clause Practice Problems
--1) Find the total sales by territory for all rows in the Sales.SalesOrderHeader table. Return only 
--those territories that have exceeded $10 million in historical sales. Return the total sales and 
--the TerritoryID column.
select TerritoryID, sum(SubTotal) as TotalSalesForTerritory
from Sales.SalesOrderHeader
group by TerritoryID
having sum(SubTotal) > 10000000

--2) Using the query from the previous question, join to the Sales.SalesTerritory table and replace 
--the TerritoryID column with the territory’s name.
select sst.Name, sum(SubTotal) as TotalSalesForTerritory
from Sales.SalesOrderHeader ssoh join Sales.SalesTerritory sst
on ssoh.TerritoryID = sst.TerritoryID
group by sst.Name
having sum(SubTotal) > 10000000

--3) Using the Production.Product table, find how many products are associated with each color. 
--Ignore all rows where the color has a NULL value. Once grouped, return to the results only those 
--colors that had at least 20 products with that color.
select Color, count(*) as QtyColor
from Production.Product
where Color is not null
Group by Color
having count(*) >=20

--4) Starting with the Sales.SalesOrderHeader table, join to the Sales.SalesOrderDetail table. This 
--table contains the line item details associated with each sale. From Sales.SalesOrderDetail, join 
--to the Production.Product table. Return the Name column from Production.Product and assign it the 
--column alias “Product Name”.
--For each product, find out how many of each product was ordered for all orders that occurred in 
--2006. Only output those products where at least 200 were ordered.
select pp.Name as "Product Name", sum(ssod.OrderQty) as QtyOrdered
from Sales.SalesOrderHeader ssoh join Sales.SalesOrderDetail ssod
on ssoh.SalesOrderID = ssod.SalesOrderID
join Production.Product pp
on ssod.ProductID = pp.ProductID
where OrderDate between '2006.01.01' and '2006.12.31'
group by pp.Name
having sum(ssod.OrderQty) >= 200

--Question 4 solution:
SELECT

P.Name AS [Product Name], SUM(SOD.OrderQty) AS ProductOrderCount
FROM Sales.SalesOrderHeader SOH
INNER JOIN Sales.SalesOrderDetail SOD ON SOD.SalesOrderID = SOH.SalesOrderID INNER JOIN 
Production.Product P
ON P.ProductID = SOD.ProductID
WHERE SOH.OrderDate BETWEEN '1/1/2006' AND '12/31/2006' GROUP BY P.Name
HAVING SUM(SOD.OrderQty) >= 200

--5) Find the first and last name of each customer who has placed at least 6 orders between July 1, 
--2005 and December 31, 2006. Order your results by the number of orders placed in descending order. 
--(Hint: You will need to join to three tables – Sales.SalesOrderHeader, Sales.Customer, and 
--Person.Person. You will use every
--clause to complete this query).
select sc.CustomerID,
       count(pp.FirstName + ' ' + pp.LastName) as Name, 
	   count(*) as QtySales
from Sales.SalesOrderHeader ssoh
inner join Sales.Customer sc
on ssoh.CustomerID = sc.CustomerID
inner join Person.Person pp
on sc.rowguid = pp.rowguid
where OrderDate between '2005.07.01' and '2006.12.31'
group by sc.CustomerID
having count(ssoh.SalesOrderNumber) >= 6
order by QtySales desc

--Question 5 solution:
--The tables dont contain an "OrdersPlaced" column
SELECT

P.FirstName, P.LastName,
COUNT(*) AS OrdersPlaced FROM Sales.SalesOrderHeader SOH INNER JOIN Sales.Customer C
ON C.CustomerID = SOH.CustomerID INNER JOIN Person.Person P
ON P.BusinessEntityID = C.PersonID
WHERE OrderDate BETWEEN '7/1/2005' AND '12/31/2006'
GROUP BY P.FirstName
HAVING COUNT(*) >= 6
ORDER
BY OrdersPlaced DESC


