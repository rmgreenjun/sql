--1) Retrieve	all	rows	from	the	HumanResources.Employee	table.		Return	only	the	
--NationalIDNumber	column
select NationalIDNumber
from HumanResources.Employee

--2) Retrieve	all	rows	from	the	HumanResources.Employee	table.		Return	the	
--NationalIDNumber	and	JobTitle	columns.
select NationalIDNumber, JobTitle
from HumanResources.Employee

--3) Retrieve	the	top	20	percent	of	rows	from	the	HumanResources.Employee	table.		
--Return	the	NationalIDNumber,	JobTitle	and	BirthDate	columns.
select top 20 percent NationalIDNumber, JobTitle, BirthDate
from HumanResources.Employee

--4) Retrieve	the	top	500	rows	from	the	HumanResources.Employee	table.		Return	the	
--NationalIDNumber,	JobTitle	and	BirthDate	columns.		Give	the	NationalIDNumber	
--column	an	alias,	“SSN”,	and	the	JobTitle	column	an	alias,	“Job	Title”.
select top 500 NationalIDNumber as SSN, JobTitle as "Job Title", BirthDate
from HumanResources.Employee

--5) Return	all	rows	and	all	columns	from	the	Sales.SalesOrderHeader	table.
select *
from Sales.SalesOrderHeader

--6) Return	the	top	50	percent	of	rows	and	all	columns	from	the	Sales.Customer	table.
select top 50 percent *
from Sales.Customer

--7) Return	the	Name	column	from the Production.vProductAndDescription view.		Give	
--this	column	an	alias	“Product’s	Name”.
select Name as "Product's Name"
from Production.vProductAndDescription

--8) Return	the	top	400	rows	from	HumanResources.Department
select top 400 *
from HumanResources.Department

--9) Return	all	rows	and	columns	from	the	table	named	Production.BillOfMaterials
select *
from Production.BillOfMaterials

--10) Return	the	top	1500 rows	and	columns	from	the	view	named	
--Sales.vPersonDemographics
select top 1500 *
from Sales.vPersonDemographics