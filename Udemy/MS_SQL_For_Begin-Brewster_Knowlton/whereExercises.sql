--1) Return	the	FirstName	and	LastName	columns	from	Person.Person	where	the	
--FirstName	column	is	equal	to	“Mark”
select FirstName, Lastname
from Person.Person
where FirstName = 'Mark'

--2) Find	the	top	100	rows	from	Production.Product	where	the	ListPrice	is	not	equal	to	
--0.00
select top 100 *
from Production.Product
where ListPrice <> 0.00

--3) Return	all	rows	and	columns	from	the	view	HumanResources.vEmployee	where	the	
--employee’s	last	name	starts	with	a	letter	less	than	“D”select *from HumanResources.vEmployeewhere LastName < 'd'--where LastName like '[a-c]%' --order by LastName--4) Return	all	rows	and	columns	from	Person.StateProvince	where	the	
--CountryRegionCode	column	is	equal	to	“CA”select *from Person.StateProvincewhere CountryRegionCode = 'CA'--5) Return	the	FirstName	and	LastName	columns	from	the	view	
--Sales.vIndividualCustomer	where	the	LastName	is	equal	to	“Smith”.		Give	the	
--column	alias	“Customer	First	Name”	and	“Customer	Last	Name”	to	the	FirstName	
--and	LastName	columns	respectively.select FirstName as "Customer First Name", LastName as "Customer Last Name"from Sales.vIndividualCustomerwhere LastName = 'Smith' --6) Using	the	Sales.vIndividualCustomer	view,	find	all	customers	with	a	
--CountryRegionName	equal	to	“Australia”	or	all	customers	who	have	a	
--PhoneNumberType	equal	to	“Cell”	and	an	EmailPromotion	column	value	equal	to	0.		
--(Hint:	the	correct	query	requires	the	use	of	parentheses	in	your	WHERE	clause)
select *
from Sales.vIndividualCustomer
where CountryRegionName = 'Australia' or (PhoneNumberType = 'Cell' and EmailPromotion = 0)

--7) Find	all	employees	from	the	view	HumanResources.vEmployeeDepartment	who	
--have	a	Department	column	value	in	the	list	of:	“Executive”,	“Tool	Design”,	and	
--“Engineering”.		Complete	this	query	twice	– once	using	the	IN	operator	in	the	
--WHERE	clause	and	a	second	time	using	multiple	OR	operators.
select *
from HumanResources.vEmployeeDepartment
--where Department in ('Executive', 'Tool Design', 'Engineering')
where Department = 'Executive' or Department = 'Tool Design' or Department = 'Engineering'

--8) Using	HumanResources.vEmployeeDepartment,	find	all	employees	who	have	a	
--StartDate	between	July	1,	2000	and	June	30,	2002.		Complete	this	query	twice	– once	
--using	the	BETWEEN	operator	and	then	by	using	a	combination	of	the	“greater	than	
--or	equal	to” and	“less	than	or	equal	to” operators.
select * 
from HumanResources.vEmployeeDepartment
--where StartDate between '2000-07-01' and '2002-06-30'
where StartDate >= '2000-07-01' and StartDate <= '2002-06-30'

--9) Find	all	customers	from	the	view	Sales.vIndividualCustomer	whose	LastName	starts	
--with	the	letter	“R”.		(Hint:	a	wildcard	character	can	assist	you	with	this	query)
select *
from Sales.vIndividualCustomer
where LastName like 'R%'

--10) Find	all	customers	from	the	view	Sales.vIndividualCustomer	whose	LastName	ends	
--with	the	letter	“r”.		(Hint:	a	wildcard	character	can	assist	you	with	this	query)
select * 
from Sales.vIndividualCustomer
where LastName like '%R'

--11) Find	all	customers	from	the	view	Sales.vIndividualCustomer	whose	LastName	is	
--either	“Lopez”,	“Martin”,	or	“Wood”	and	whose	FirstName	starts	with	any	letter	
--between	“C”	and	“L”	in	the	alphabet.	(Hint:	multiple	wildcard	characters	will	be	used	
--in	this	query)
select *
from Sales.vIndividualCustomer
where LastName in ('Lopez', 'Martin', 'Wood') and FirstName like '[c-l]%'

--12) Return	all	columns	from	the	Sales.SalesOrderHeader	table	for	all	sales	that	are	
--associated	with	a	sales	person.		That	is,	return	all	rows	where	the	SalesPersonID	
--column	does	not	contain	a	NULL	value.
select *
from Sales.SalesOrderHeader
where SalesPersonID is not null

--13) Return	the	SalesPersonID	and	TotalDue	columns	from	Sales.SalesOrderHeader	for	
--all	sales	that	do	not	have	a	NULL	value	in	the	SalesPersonID	column	and	whose	
--TotalDue	value	exceeds	$70,000.
select SalesPersonID, TotalDue
from Sales.SalesOrderHeader
where SalesPersonID is not null and TotalDue > 70000.00