CREATE DATABASE TestData
GO
--drop newly created db, add new one with table
USE master;
GO
--delete database TestData if it exists
IF EXISTS (SELECT * FROM sys.databases WHERE NAME='TestData')
BEGIN
	DROP DATABASE TestData
END
--create new database TestData
CREATE DATABASE TestData;

USE TestData
GO
--create table named products
--columns in the table are named ProductID, ProductName, Price, and ProductDescription.
--The ProductID column is the primary key of the table. 
--int, varchar(25), money, and text are all data types. Only the Price and ProductionDescription columns 
--can have no data when a row is inserted or changed. This statement contains an optional element 
--(dbo.) called a schema. The schema is the database object that owns the table. If you are an 
--administrator, dbo is the default schema. dbo stands for database owner.
--CREATE TABLE dbo.Products
--(ProductID int PRIMARY KEY NOT NULL,
--ProductName varchar(25) NOT NULL, Price money NULL, ProductDescription text NULL)
--GO

CREATE TABLE dbo.Products
(ProductID			int			PRIMARY KEY	NOT NULL,
ProductName			varchar(25)	NOT NULL,
Price				money		NULL,
ProductDescription	text		NULL)
GO

--Execute the following statement to insert a row into the Products table that was created in the 
--previous task. This is the basic syntax.
---- Standard syntax
--INSERT dbo.Products (ProductID, ProductName, Price, ProductDescription)
--VALUES (1, 'Clamp', 12.48, 'Workbench clamp')

--50		Screwdriver		3.17	Flat head
--75		Tire Bar		null	Tool for changing tires.
--3000	3mm Bracket		.52		null

--GO

INSERT INTO Products
	(ProductID, ProductName, Price, ProductDescription)
VALUES
	(1, 'Clamp', 12.48, 'Workbench clamp'),
	(50, 'Screwdriver', 3.17, 'Flat head'),
	(75, 'Tire Bar', NULL, 'Tool for changing tires'),
	(3000, '3mm Bracket', .52, NULL)
GO

INSERT INTO Products
	(ProductID, ProductName, Price, ProductDescription)
VALUES
	(50, 'Screwdriver', 3.17, 'Flat head'),
	(75, 'Tire Bar', NULL, 'Tool for changing tires'),
	(3000, '3mm Bracket', .52, NULL)
GO

SELECT * 
FROM Products

--Type and execute the following UPDATE statement to change the ProductName of the second product 
--from Screwdriver, to Flat Head Screwdriver.
--UPDATE dbo.Products
--SET ProductName = 'Flat Head Screwdriver'
--WHERE ProductID = 50
--GO

UPDATE Products
SET ProductName = 'Flat Head Screwdriver'
WHERE ProductID = 50
GO

--CREATE LOGIN [computer_name\Mary]
--FROM WINDOWS
--WITH DEFAULT_DATABASE = [TestData];
--GO

use TestData
GO

--create login for user account Mary
CREATE LOGIN [DESKTOP-GB1MDQF\Mary]
FROM WINDOWS
WITH DEFAULT_DATABASE = [TestData];
GO

--authorize Mary as database user & grant Mary access to databases
--use the CREATE USER statement to map her login to a user named Mary.
--Type and execute the following statements (replacing computer_name with the name of your computer) 
--to grant Mary access to the TestData database.
--USE [TestData]; GO

--CREATE USER [Mary] FOR LOGIN [computer_name\Mary]; GO

--Now, Mary has access to both SQL Server and the TestData database.

CREATE USER [Mary]
FOR LOGIN [DESKTOP-GB1MDQF\Mary];
GO

--create a view
--Execute the following statement to create a very simple view that executes a select
--statement, and returns the names and prices of our products to the user.
--CREATE VIEW vw_Names AS
--SELECT ProductName, Price FROM Products;
--GO
CREATE VIEW vw_Names AS
SELECT ProductName, Price
FROM Products
GO

SELECT *
FROM vw_Names
GO

--create a stored procedure
--The following statement creates a stored procedure name pr_Names, accepts an input parameter named 
--@VarPrice of data type money. The stored procedure prints the statement Products less than 
--concatenated with the input parameter that is changed from the money data type into a varchar(10) 
--character data type. Then, the procedure executes a SELECT statement on the view, passing the input 
--parameter as part of the WHERE clause. This returns all products that cost less than the input
--parameter value.
--CREATE PROCEDURE pr_Names @VarPrice money AS
--BEGIN
---- The print statement returns text to the user 
--PRINT 'Products less than ' + CAST(@VarPrice AS
--varchar(10));
---- A second statement starts here 
--SELECT ProductName, Price FROM vw_Names
--WHERE Price < @varPrice;
--END
--GO
CREATE PROCEDURE pr_Names @VarPrice money 
AS
BEGIN
	PRINT 'Products less than ' + CAST(@VarPrice AS varchar(10));
	SELECT ProductName, Price
	FROM vw_Names
	WHERE Price < @VarPrice;
END
GO

--test stored procedure
--To test the stored procedure, type and execute the following statement. The procedure should return 
--the names of the two products entered into the Products table in Lesson 1 with a price that is less 
--than 10.00.
--EXECUTE pr_Names 10.00;
--GO
EXECUTE pr_Names 10.00;
GO

--grant user Mary access to the various objects
--Execute the following statement to give Mary the EXECUTE permission for the
--pr_Names stored procedure.
--GRANT EXECUTE ON pr_Names TO Mary; GO
GRANT EXECUTE 
ON pr_Names
TO Mary;
GO

--In this scenario, Mary can only access the Products table by using the stored procedure. If you 
--want Mary to be able to execute a SELECT statement against the view, then you must also execute     
--GRANT SELECT ON vw_Names TO Mary. To remove access to database objects, use the REVOKE
--statement.
GRANT SELECT
ON vw_Names 
TO Mary;
GO

USE TestData;
GO

--Use the REVOKE statement to remove execute permission for Mary on the stored procedure:
--REVOKE EXECUTE ON pr_Names FROM Mary;
--GO
REVOKE EXECUTE 
ON pr_Names
FROM Mary;
GO

--Use the DROP statement to remove permission for Mary to access the TestData database.
--DROP USER Mary;
--GO
DROP USER Mary;
GO
--Use the DROP statement to remove permission for Mary to access this instance of SQL server:
--DROP LOGIN [<computer_name>\Mary];
--GO
DROP LOGIN [DESKTOP-GB1MDQF\Mary];
GO

--USE the DROP statement to remove the stored procedure pr_Names
--DROP PROC pr_Names;
--GO
DROP PROC pr_Names
GO


--6.   Use the DROP statement to remvove the view vw_Names:
--DROP View vw_Names; GO
DROP View vw_Names;
GO

--7.   Use the DELETE statement to remove all rows from the Products table:
--DELETE FROM Products; GO
DELETE FROM Products;
GO

--8.   Use the DROP statement to remove the Products table:
--DROP Table Products; GO
DROP TABLE Products;
GO

--9. You cannot remove the TestData database while you are in the database; therefore, first switch 
--context to another database, and then use the DROP statement to remove the TestData database:
--USE MASTER; GO
--DROP DATABASE TestData;
--GO
USE Master;
GO
DROP DATABASE TestData;
GO

















	

	 

