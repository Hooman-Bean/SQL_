Select Convert (date, '14/02/2017', 103) AS Col1, 
CONVERT (date, '02/14/2017', 101) AS Col2

Select try_Convert (date, '14/02/2017', 101) AS Col1, 
Try_CONVERT (date, '02/14/2017', 101) AS Col2

Use sayan_database

 
Select orderid, orderdate, MONTH(Orderdate), DAY(Orderdate), YEAR(orderdate) 
From Sales.orders 

Select orderdate, orderid, DATEPART (dy, orderdate) 
From Sales.orders

select empid, country, region, city, 
country + ISNULL(N', ' + region, N'') + N', ' + city as location 
from hr.Employees