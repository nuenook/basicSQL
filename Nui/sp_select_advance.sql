------- Create View for shortcut everything xD-------
create view TotalOrderPrice as 
select C.[CustomerID], C.[CompanyName], C.[ContactName],sum(OD.[UnitPrice]*OD.[Quantity]) as [TotalOrderPrice]
from [dbo].[Customers] as C JOIN [dbo].[Orders] as O
on C.[CustomerID] = O.[CustomerID] JOIN [dbo].[Order Details] as OD
on O.[OrderID] = OD.[OrderID]
group by C.[CustomerID],C.[CompanyName],C.[ContactName]
--order by [CustomerID] asc
------ just test ------------
select round(sum(TotalOrderPrice),0) as [Maximum is]
from TotalOrderPrice

select round(sum(TotalOrderPrice),0) as [Maximum is]
from TotalOrderPrice

select * from TotalOrderPrice 
order by [CustomerID]

----- Create Procedure Here-----------
create procedure sp_select_advance
@manage_type as tinyint
as
begin
	if( @manage_type = 1)
	begin 
		select * from TotalOrderPrice order by [CustomerID] asc
	end

	else if( @manage_type = 2 )
	begin
		select max(TotalOrderPrice) as [Maximum is]
		from TotalOrderPrice
	end

	else if( @manage_type = 3 )
	begin
		select min(TotalOrderPrice) as [Minimum is]
		from TotalOrderPrice
	end

	else if( @manage_type = 4 )
	begin
		select avg(TotalOrderPrice) as [Average is]
		from TotalOrderPrice
	end

	else
	begin
		select round(sum(TotalOrderPrice),0) as [Summary]
		from TotalOrderPrice
	end
end

-------- execute ------
exec sp_select_advance 0