1
create view view_product_order_li
as 
select p.productname,p.ProductID, sum(od.quantity) as quality from products as p inner join  [Order Details] as od on p.productid= od.ProductID group by p.productid, p.ProductName 
--order by p.ProductID  ²»ÄÜÓÐorder in view
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



--- seems not working in print
drop procedure sp_product_order_quantity_li
create procedure sp_product_order_quantity_li
@id int,
@totalquantitys 
as 
begin
 print (select   nt.quality from (select p.productname,p.ProductID, sum(od.quantity) as quality from products as p inner join  [Order Details] as od on p.productid= od.ProductID group by p.productid, p.ProductName) as nt where nt.ProductID=@id)
end
exec sp_product_order_quantity_li 2
------

3.
create procedure sp_product_order_city_li


--set nocount on;
 DECLARE @sqlCmd NVARCHAR(max)
 DECLARE @outputtable AS TABLE
 (
     
	 productname varchar(20),
	 city varchar(20),
		totalquantity varchar(20)
 )
 SET @sqlCmd = 
     '  select top 5 p.ProductName, o.shipcity, count(p.ProductID) as diffproducttotal,sum(od.quantity) as totalquantityperproduct  from orders as o join [Order Details] as od on o.orderid =od.OrderID  join products as p on od.ProductID = p.ProductID group by o.ShipCity,p.ProductName  having p.productname = 'chai' order by diffproducttotal desc AS T '
	  INSERT INTO @outputtable 
     EXEC sp_executesql @sqlCmd;

4




5
SELECT * FROM TableA
UNION 
SELECT * FROM TableB
EXCEPT 
SELECT * FROM TableA
INTERSECT
SELECT * FROM TableB;
