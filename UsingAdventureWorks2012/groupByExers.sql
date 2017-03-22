--udemy
--Microsoft SQL for Beginners - Brewster Knowlton

use AdventureWorks2012
--GROUP BY Clause Practice Problems
--1)  In the Person.Person table, how many people are associated with each PersonType?
select PersonType, count(*) as QtyPersonType
from Person.Person
group by PersonType

--2) Using only one query, find out how many products in Production.Product are the color “red” and 
--how many are “black”.
select Color, count(*) as QtyColor
from Production.Product
where Color in ('red', 'black')
group by Color

--3) Using Sales.SalesOrderHeader, how many sales occurred in each territory between July 1, 2005 and 
--December 31, 2006? Order the results by the sale count in descending order.
select TerritoryID, count(*) as QtySales  
from Sales.SalesOrderHeader
where OrderDate between '2005.07.01' and '2006.12.31'
group by TerritoryID
order by QtySales desc

--4) Expanding on the previous example, group the results not by the TerritoryID but by the name of 
--the territory (found in the Sales.SalesTerritory table).
select sst.Name, count(*) as QtySales  
from Sales.SalesOrderHeader ssoh join Sales.SalesTerritory sst
on ssoh.TerritoryID = sst.TerritoryID
where OrderDate between '2005.07.01' and '2006.12.31'
group by sst.Name
order by QtySales desc

--5)  Using the Book, BookAuthor, Author and/or Publisher tables, identify how many
--books each author either wrote or co-­‐authored.

