---tempory table    ---和cte 区别？？？？？？？？？？？？？？？？？？？？？？？？
drop  table #localtempdemo1   -------???? why cannot drop
create table #localtempdemo1
(
	anyid int primary key,
	num int 
)

declare @variable int=1
while (@variable<=10)
begin
insert into #localtempdemo1 (anyid,num) values (@variable, @variable-1)------注意写法
set @variable = @variable+1

end
select * from #localtempdemo1

create table ##localtempdemo2  ------------------##两个 是globle temp table 不值当前 window 可见
(
	anyid int primary key,
	num int 
)

------view------store in view

create view vm
as 
select 
from

----sql injection vs procedure   36分钟  43 分   相当于
select id 
from table 
where id = 1 -- 如果 我写入 1 union select id from table  这样 我把 全部密码都得到了    ---改成 变量@string  可以避免
select * from INFORMATION_SCHEMA.COLUMNS
--但如果 我把
declare @string  varchar(20) 
set @string = '1'
----procedure   49分钟 有个 调用 procedure
----可以有 return  但只能是int     可以有 @ out put  可以任意

create proc sphello
as 
begin{
select *from employees
 print'hello'
 }
end
exec sphello

---specical procedure  
--triggers  自动 存在 procedure   not use that much  经常搞混
--update delete  dml  ddl   logon 登陆 登出


---------function    在 programmability 中 找
--diff sp and function  return 
--sp  for dml  data modify 改变数据     function  calculation
--pagination 
--constraints


1.
select distinct e.City from Employees as e where e.city in (select c.city from customers as c) 

2.
select distinct e.City from Employees as e where e.city not in (select c.city from customers as c) 
select e.city from Employees as e left join customers as c on e.city = c.city where c.city is null 
3
select sum(od.quantity), od.productid, (select p.ProductName as nnn from products as p where od.ProductID=p.ProductID) from [Order Details] as od group by od.ProductID-----, nnn order by 1 subquery 不属于groupby 
--group by have two terms
select sum(od.quantity), od.productid, od.discount,(select p.ProductName as nnn from products as p where od.ProductID=p.ProductID) from [Order Details] as od group by od.ProductID,od.Discount-----, nnn order by 1 subquery 不属于groupby 
4
select c.city, count(o.OrderID) from customers as c join orders as o on c.CustomerID = o.CustomerID group by c.City  

5
--- this question seem use group by is enough
select count(c.customerid) as numofcustomers, c.City as ct from customers as c group by c.city having count(c.customerid)>=2
6.
select count(distinct od.ProductID) ,  o.shipcity  from orders as o join [order details] as od on o.orderid =od.OrderID group by o.ShipCity  having count(distinct od.ProductID)>2
7.
select c.ContactName from orders as o left join customers as c on o.CustomerID=c.CustomerID where o.ShipCity != c.City  
8.-------是不是 得用 over  windous 
---select sum(od.UnitPrice), od.ProductID from orders as o  join [Order Details] as od group by od.ProductID
select sum(od.UnitPrice) as price, count(od.productid) as num, od.ProductID from orders as o  join [Order Details] as od  on o.orderid =od.orderid group by od.ProductID order by 2 desc
9
select e.city as city from Employees as e where city not in (select o.shipcity from orders as o ) 

10
select count(o.orderid) as numofitem, e.City , o.employeeid from employees as e join orders as o on e.EmployeeID =o.EmployeeID group by o.EmployeeID , e.city
select top 1 od.ProductID, sum(od.quantity) as qua from [Order Details]as od group by od.ProductID order by qua desc  --get productid which has most quantity
 select o.shipcity from orders as o where 
 
 
 with cte
 as(
 select o.shipcity from orders as o where o.Orderid in( select od.orderid from  [Order Details] as  od where od.ProductID=60)
 )
 select t1.city from 
 (select count(o.orderid) as numofitem, e.City , o.employeeid from employees as e join orders as o on e.EmployeeID =o.EmployeeID group by o.EmployeeID , e.city)
 as t1
 join cte 
 on t1.city =cte.shipcity



11
use key word distinct