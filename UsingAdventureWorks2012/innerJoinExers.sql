use AdventureWorks2012
--INNER	JOIN	Practice	Problems
--1) Using	the	Person.Person	and	Person.Password	tables,	INNER	JOIN	the	two	tables	
--using	the	BusinessEntityID	column	and	return	the	FirstName	and	LastName	
--columns	from	Person.Person	and	then	PasswordHash	column	from	
--Person.Password
select p.FirstName, p.LastName, pw.PasswordHash
from Person.Person p
Inner Join Person.Password pw
on p.BusinessEntityID = pw.BusinessEntityID

--2) Join	the	HumanResources.Employee	and	the	
--HumanResources.EmployeeDepartmentHistory	tables	together	via	an	INNER	JOIN	
--using	the	BusinessEntityID	column.		Return	the	BusinessEntityID,	
--NationalIDNumber	and	JobTitle	columns	from	HumanResources.Employee	and	the	
--DepartmentID,	StartDate,	and	EndDate	columns	from	
--HumanResources.EmployeeDepartmentHistory.		Notice	the	number	of	rows	
--returned.		Why	is	the	row	count	what	it	is?
select he.BusinessEntityID, he.NationalIDNumber, he.JobTitle,
	   edh.DepartmentID, edh.StartDate, edh.EndDate
from HumanResources.Employee he
inner join HumanResources.EmployeeDepartmentHistory edh
on he.BusinessEntityID = edh.BusinessEntityID

--3) Expand	upon	the	query	used	in	question	1.		Using	the	existing	query,	add	another	
--INNER	JOIN	to	the	Person.EmailAddress	table	and	include	the	EmailAddress	column	
--in	your	select	statement. 
select p.FirstName, p.LastName, 
       pw.PasswordHash,
	   pe.EmailAddress
from Person.Person p
Inner Join Person.Password pw
on p.BusinessEntityID = pw.BusinessEntityID 
inner join Person.EmailAddress pe
on pe.BusinessEntityID = p.BusinessEntityID


--*****Database not attached for exer 4 & 5********
--4) Using	the	Book,	BookAuthor	and	Author	tables,	join	them	together	so	that	you	
--return	the	Title	and	ISBN	columns	from	Book	and	the	AuthorName	column	from	
--Author.		(Hint:	You	must	start	with	the	BookAuthor	table	in	your	FROM	clause	even	
--though	we	will	not	be	returning	any	columns	from	this	table)
select b.title, b.isbn,
       a.AuthorName 
from Book b
inner join BookAuthor ba
on ba.BookID = b.BookID
inner join Author a
on a.AuthorID = ba.AuthorID 

--5) Using	the	query	from	example	4,	add	another	INNER	JOIN	that	joins	the	Publisher	
--table	with	your	query.		Return	the	PublisherName	column	from	this	table.		So,	you	
--should	return	the	Title	and	ISBN	columns	from	Book,	the	AuthorName	column	from	
--Author,	and	the	PublisherName	column	from	Publisher.		(Hint:	this	will	require	
--three	separate	INNER	JOINs).