--udemy
--Microsoft SQL for Beginners - Brewster Knowlton

use AdventureWorks2012

--Aggregate Function Practice Problems
--1)  How many rows are in the Person.Person table? Use an aggregate function  NOT
--“SELECT *”.
select count(*) as NumberOfRows
from Person.Person

--2) How many rows in the Person.Person table do not have a NULL value in the MiddleName column?
select count(MiddleName)
from Person.Person

--3) What is the average StandardCost (located in Production.Product) for each product where the 
--StandardCost is greater than $0.00?
select Name, avg(StandardCost) as AverageCost
from Production.Product
where StandardCost > 0
group by Name
order by AverageCost

select avg(StandardCost)
from Production.Product
where StandardCost > 0

--4) What is the average Freight amount for each sale (found in Sales.SalesOrderHeader) where the 
--sale took place in TerritoryID 4?
select avg(Freight) as AvgFreightAmt
from Sales.SalesOrderHeader
where TerritoryID = 4

select Freight, TerritoryID
from Sales.SalesOrderHeader
where TerritoryID = 4
order by Freight


--5) How expensive is the most expensive product, by ListPrice, in the table Production.Product?
select max(ListPrice) as MostExpensiveItem
from Production.Product

--6) Join the Production.Product table and the Production.ProductInventory table for only the 
--products that appear in both table.  Use the ProductID as the joining column.  
--Production.ProductInventory contains the quantity of each product (several rows can appear for each 
--product to indicate the product appears in multiple locations).  Your goal is to determine how much 
--money we would earn if we sold every product for its list price for each product with a ListPrice 
--greater than
--$0. That is, if you summed the product of each product’s inventory by its list price, what would 
--that value be? (Hint: This is intentionally challenging. You must use an
--aggregate function with a mathematical expression to accomplish your goal)
select sum(ListPrice * Quantity) as TotalPrice
from Production.Product pp join Production.ProductInventory ppi
on pp.ProductID = ppi.ProductID
where ListPrice > 0

