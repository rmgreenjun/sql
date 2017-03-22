use AP

--ch3 exer1
select [VendorContactFName] as FirstName, [VendorContactLName] as LastName, vendorname
from Vendors
order by LastName, FirstName;

--ch3 exer2
select InvoiceNumber as number, 
		InvoiceTotal as total, 
		paymenttotal + credittotal as credits, 
		invoicetotal - ( paymenttotal + CreditTotal) as balance
from Invoices
where invoicetotal - ( paymenttotal + CreditTotal) > 0
order by balance desc;

--ch3 exer3
select [VendorContactLName] + ', ' + [VendorContactFName] as 'full name'
from Vendors
order by [VendorContactLName], [VendorContactFName];

--ch3 exer4
select invoicetotal,
	   invoicetotal * .1 as '10%',
	   invoicetotal * 1.1 as 'Plus 10%',
	   [InvoiceTotal] - ([PaymentTotal] + [CreditTotal]) as balance	
from Invoices
where [InvoiceTotal] - ([PaymentTotal] + [CreditTotal]) > 1000
order by InvoiceTotal desc;

--ch3 exer5, modify exer2 
select InvoiceNumber as number, 
		InvoiceTotal as total, 
		paymenttotal + credittotal as credits, 
		invoicetotal - ( paymenttotal + CreditTotal) as balance
from Invoices
where invoicetotal between 500 and 10000
order by balance desc;

--ch3 exer6, modify exer3
select [VendorContactLName] + ', ' + [VendorContactFName] as 'full name'
from Vendors
where [VendorContactLName] like '[a-c,e]%' 
order by [VendorContactLName], [VendorContactFName];

--ch3 exer7
select invoicetotal, paymentdate,
	   [InvoiceTotal] - ([PaymentTotal] + [CreditTotal]) as balance
from invoices
where paymentdate is null or ([InvoiceTotal] - ([PaymentTotal] + [CreditTotal])) > 0
Order by balance;
