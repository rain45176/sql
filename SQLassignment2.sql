use northwind 
go 
select *from Products

select count(*) as totalnum from orders --aggregate func

select * from orders
print @@RowCount --���� row �ܵ�Ӱ�� built in
--@@ ����ֱ���ò��� ��Ϊ����ȫ�ֱ���  select ֮�� ����ʧ��

select sum(unitprice) as sumprice from Products --programmability -function - sys func     aggregate  �� group by ���� ����

select supplierid from products group by supplierid   -- ��������� distinct ������
select distinct supplierid from products

select supplierid, ProductName ,sum(UnitPrice) from products group by supplierid  --Ϊɶ ��������   ��������� group by +productname ����??????
select supplierid, ProductName ,sum(UnitPrice) from products group by supplierid, productname  --���������� ����ָ��ͬ���Ķ���   ��Ȼrefer same thing Ϊʲô���У�������������

select customerid, shipcity, count(customerid) from orders group by customerid, ShipCity--������ һ����˼  �����ж��ٸ��ֶ� ������
select customerid, shipcity, count(1) from orders group by customerid, ShipCity order by  1--����1����customerid��� column?

select count(region) from employees-- ������ reion ��null �����
select region from Employees
select count(*) from Employees    ---���� reion ��null �����
select * from Employees


select c.customerid , c.ContactName,c.Country,count(o.orderID) as qqq --selct �м��� ����group by �͵��м���
from orders as o inner join Customers as c on c.CustomerID= o.CustomerID 
group by  c.customerid , c.ContactName,c.Country  
having count(o.orderID)=1--   having qqq=1     ��������     Ϊʲô�أ�������������  ����Ϊ select ���ȼ� ������� as ��û����
order by 4      --order �����   -- from > where >  group by>  having > select >distinct > order by

select * from customers
select  count(city) as allcity, count(distinct city ) as distcity, count(country)  from customers  --����aggregate

select Top 5 UnitPrice , productname from products order by unitprice     --top��order���� ��������

select Top 10 percent UnitPrice , productname from products order by unitprice     --top��order���� ��������   �ٷֱ�

-----47.30   sun(�˷�)   ���� inner join ������


select city, contactname from customers --- Ƕ��sub query
where city in('londaon','new')
select city from customers        -----����仰�ŵ�����������
where ContactName ='victoria ashworth'



--ִ��ʱ����� �Ƚ�    55����

select city, contactname from customers 
where CustomerID in 
(select distinct customerid from orders) as db   -- �����Ǵ��  ֻ�� from ����� ()as table 
----------------------------------------------------------------------------------------
select o.orderid,
(select e1.firstname from Employees as e1 where o.employeeid = e1.employeeid) as fn
from orders as o

select firstname from Employees as e1 where orders.EmployeeID = e1.EmployeeID

select o.orderid,
(select firstname  from Employees as e1 where e1.employeeid in (select or2.employeeid from orders as or2)) as fn
from orders as o
select *from orders
---�ú����Ϊʲô����Ĳ��� ����� ����  ��Ϊ select ��һ��һ�н��е�     ��select �е�  subquery ���ܱ������ó����԰ɣ�����������������������������
-------------------------------------------------------------------------------------------
-- cte ������� subquery �� ��ʱ����
with cte
as(select employeeid, firstname+''+lastname[full name],city
from employees
)
select * from cte 

-----Unions   vertical ��ֱ
--union all ��ȥ��
select city, country from customers
union
select city, country 
from employees












select * from Products order by SupplierID
------------------------------------------assignment 1-11-----------------------------------------

select    count(*) from products   
select productid  from products where ProductID in( select ProductSubcategoryID from subcategory where ProductSubcategoryID is null) 
select ProductSubcategoryID ,count(SubCategory) as CountedProducts from SubCategory  group by SubCategory
select count(productid), productid from products where SubCategory is null group by SubCategory --should be right after tesing
          --�Ǵ�select count(*), supplierid from products where supplierid =1 group by SupplierID --having SupplierID =1 
select sum (quantity) from [Production].[ProductInventory]  
--------select sum(UnitPrice) from Products  
select prodectid , sum(quantity) as thesum from [Production].[ProductInventory] where locationid =40 group by prodectid having sum(quantity)>100
-----select sum(UnitPrice) from Products  where supplierid =1 group by supplierid having sum(UnitPrice)>46 sum һ�� �÷���having��
select [shelf information] as shelf , productid, sum(quantity) from [Production].[ProductInventory] where locationid =40 group by [shelf information], ProductID   having sum(product)<100
select avg(quantity) from products where locationid = 10 group by locationid
---select avg(unitprice),supplierid, categoryid from products  group by supplierid, categoryid order by supplierid
select productid, shlf,avg(quantity ) from products group by shelf ,productionid ---if productid is no 1 to 1 relationship with shelf  then this group not valid

select productid , shelf ,avg(quantity) 
from (select * from products where shelf in (select shelf from  Production.ProductInventory where shelf !=N/A)) as newtable  --2 subquery
 group by shelf, productid  

11th I do not know how to do it  
select  sum(color), avg(color) from product where color=null or class =null -- no need  ????group by color , class  --not sure about it


--joins-----------------------------------

select a.country, b.province from CountryRegion as a join StateProvince as b  on a.country = b.country

select a.country, b.province from CountryRegion as a join StateProvince as b  on a.country = b.country where a.county in('germany', 'canada')

14 not sure about data calculation
select od.orderid , o.RequiredDate from  orders as o join [Order Details]as od on o.orderid=od.OrderID where o.RequiredDate >'1997-08-01 00:00:00.000' order by 2

15
select count( distinct o.orderid ) , o.ShipPostalCode from orders as o group by o.ShipPostalCode order by 1

16
select Top 5 count( distinct o.orderid ) , o.ShipPostalCode from orders as o group by o.ShipPostalCode 
where o.RequiredDate >'1997-08-01 00:00:00.000' order by 1
--25����ô��ʾ????????????????????????????

17
select c.City , count(distinct c.CustomerID )  as [num of customer]from orders as o join Customers as c on o.CustomerID = c.CustomerID group by c.city  order by 2
--select *  from Customers order by city where Customers.city ='Caracas'
18
select c.City , count(distinct c.CustomerID )  as [num of customer]from orders as o join Customers as c on o.CustomerID = c.CustomerID group by c.city  having count(distinct c.CustomerID ) >2 order by 2
--distinct �Ǳ��⾫��

19
--Ϊʲô ���������ԣ�������������������������������������������������������������������
select o.requireddate ,(select c.contactname from customers as c where o.RequiredDate='1996-08-01 00:00:00.000' ) as name from orders as o
select o.requireddate, c.contactname from customers as c join orders as o on o.CustomerID=c.CustomerID where  o.RequiredDate>'1998-01-01 00:00:00.000' 
21
select count(o.OrderID), c.contactname from orders as o join customers as c on c.CustomerID = o.CustomerID  group by c.ContactName 

22
select count(o.OrderID), c.CustomerID, c.ContactName from orders as o join customers as c on c.CustomerID = o.CustomerID  group by c.CustomerID, c.ContactName having count(o.OrderID)>100


23

select s.CompanyName,   supp.CompanyName       from  orders as o join shippers as s on o.shipvia = s.ShipperID join [Order Details] as od on od.OrderID=o.OrderID join products as p on p.ProductID=od.ProductID join suppliers as supp on supp.SupplierID=p.SupplierID

24
--if I group by data how can I show product name ? as there could be many product in one day--????????????????????????????????????? 
25
select a.firstname+' '+a.LastName, a.employeeid, b.firstname+' '+b.LastName, b.employeeid from employees as a join employees as b on a.title = b.title and a.EmployeeID !=b.EmployeeID

26
with cte
as
(select count(1) as rtnum, e1.ReportsTo as rt from employees as e1 group by e1.ReportsTo )
select rt from cte  where cte.rtnum >2

27
select supp.city as suppliercity, supp.CompanyName as companyname, supp.ContactName 
from  orders as o join shippers as s on o.shipvia = s.ShipperID join [Order Details] as od on od.OrderID=o.OrderID join products as p on p.ProductID=od.ProductID join suppliers as supp on supp.SupplierID=p.SupplierID
