1
create view view_product_order_li
as 
select p.productname,p.ProductID, sum(od.quantity) as quality from products as p inner join  [Order Details] as od on p.productid= od.ProductID group by p.productid, p.ProductName 
--order by p.ProductID  不能有order in view
--select supplierid ,sum(unitprice) over (partition by supplierid) from products
--select supplierid ,sum(unitprice) over () from products
2.
drop procedure sp_product_order_quantity_li
create procedure sp_product_order_quantity_li
@id int,
@totalquantitys int OUT
as 
begin
 select @totalquantitys = nt.quality from (select p.productname,p.ProductID, sum(od.quantity) as quality from products as p inner join  [Order Details] as od on p.productid= od.ProductID group by p.productid, p.ProductName) as nt where nt.ProductID=@id
end

begin
declare @outputq int
exec sp_product_order_quantity_li 2,@outputq out
select @outputq
--select @
end



--- -------------------seems not working in print-------------------------------------
drop procedure sp_product_order_quantity_li
create procedure sp_product_order_quantity_li
@id int,
@totalquantitys 
as 
begin
 print (select   nt.quality from (select p.productname,p.ProductID, sum(od.quantity) as quality from products as p inner join  [Order Details] as od on p.productid= od.ProductID group by p.productid, p.ProductName) as nt where nt.ProductID=@id)
end
exec sp_product_order_quantity_li 2
-------------------------------------------------------------------------

3.
create table #sprocResult (
 ProductName varchar(30),
  shipcity varchar(30),
 diffproducttotal int,
 totalquantityperproduct int

 -- define columns that match the results of the sproc.
  -- You should also define a PK, and possibly other indexes
)
create procedure sp_product_order_city_li

 @name varchar(20)   ---@ input out      declare in 是变量
as 
begin
 
      select  p.ProductName, o.shipcity, count(p.ProductID) as diffproducttotal,sum(od.quantity) as totalquantityperproduct  from orders as o join [Order Details] as od on o.orderid =od.OrderID  join products as p on od.ProductID = p.ProductID group by o.ShipCity,p.ProductName  having p.productname = @name order by diffproducttotal desc 
end
insert into #sprocResult exec sp_product_order_city_li @name='chai'   ---执行procedure   把procedure 装进 已经有的 样表中
 select top 5* from #sprocResult
drop procedure sp_product_order_city_li

4
create table city_li (
id int primary key ,
city varchar(20)
)
create table people_li(
id int primary key,
name varchar(20),
fcity int foreign key  references city_li(id) ON DELETE CASCADE)---------------------重要

insert into city_li values
(1, 'seattle'), 
(2,'green bay')
select * from city_li
select* from people_li
insert into people_li values (1,'Aaron Rodgers',2),
(2, 'Russell Wilson', 1), ( 3,  'Jody Nelson',2)

BEGIN TRAN tran_delete
       delete from city_li where city= 'seattle';  ---------------------no change ????

ROLLBACK TRAN tran_delete

-------create view
create view Packers_li
as 
select city from city_li where city ='green bay'
select * from packers_li
drop view Packers_li
drop table people_li
drop table city_li




5
select * from Employees
create table #birthday_employees_li (
 Name varchar(30),
bithday DATETIME

 -- define columns that match the results of the sproc.
  -- You should also define a PK, and possibly other indexes
)
create procedure findbirthday
@suppliedDate int
as
begin
--select e.firstname+' '+e.LastName,  e.BirthDate from employees as e where e.BirthDate like'%'+@bithmonth+'%' 
select c.firstname as name,  c.BirthDate from employees as c
WHERE datepart(m,c.birthdate) = @suppliedDate
end
insert into #birthday_employees_li exec findbirthday @suppliedDate=2
drop procedure findbirthday
select * from #birthday_employees_li



6
SELECT * FROM TableA
UNION 
SELECT * FROM TableB
EXCEPT 
SELECT * FROM TableA
INTERSECT
SELECT * FROM TableB;
