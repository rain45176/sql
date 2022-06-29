select productId, Name, Color, listPrice from [production].[product] 
select productId, Name, Color, listPrice as p from [production].[product] where p=0
select productId, Name, Color as c, listPrice as p from [production].[product] where c is null
select productId, Name, Color as c, listPrice as p from [production].[product] where c is not null
select productId, Name, Color as c, listPrice as p from [production].[product] where c is not null and p>0
select productId, Name, Color as c, listPrice as p from [production].[product] where c is not null
select concat (Name, '', Color)  as namecolor from [production].[product]    where color is not null

select name , color from [production].[product] where name in ('LL Crankarm','ML Crankarm', 'HL Crankarm', 'Chainring Bolts','Chainring Nut',' Chainring') and color in ('black','silver')
or
select name , color from [production].[product] where name like '%crankarm' and name like 'chainring%' and color in ('black','silver')


select productId as p, Name  from [production].[product] where p >=400 and p<=500

select productId, Name, Color as c as p from [production].[product] where c in ('black', 'blue')

select  Name from [production].[product] where name like 'S%'

select  Name,  listPrice  from [production].[product] order by name

select  Name,  listPrice  from [production].[product] where name like 'A%'  or name like 'S%' order by name

select name  from [production].[product] where name like 'SPO%' AND name not like '___K%' order by name

select distinct  color  from [production].[product] order by manner desc

select distinct  ProductSubcategoryID as p , color as c from [production].[product] where p is not null and c is not null
