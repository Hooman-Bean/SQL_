--TOP OFFSET-FETCH

select /*top (3)*/ orderid, custid, empid, orderdate
from sales.orders
order by orderdate desc;

select top (1) percent orderid, custid, empid, orderdate
from sales.orders
order by orderdate desc;

select orderid, orderdate, custid, empid
from sales.orders
order by orderdate asc, orderid asc
