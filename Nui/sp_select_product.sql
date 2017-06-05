------ execute ---------------
exec sp_select_product 1


------- create procedure --------
create procedure sp_select_product
@manage_type as tinyint
as
begin
	if( @manage_type = 1)
	begin 
		select [ProductID] as ProductCode,[ProductName], [UnitPrice] as Price,(UnitPrice*1.07) as [Price Include Vat]
		from [dbo].[Products]
	end
	else if( @manage_type = 2 )
	begin
		select max(UnitPrice) as [The maximum Price]
		from [dbo].[Products]
	end
	else if( @manage_type = 3 )
	begin
		select min(UnitPrice) as [The minimum Price]
		from [dbo].[Products]
	end
	else
	begin
		select avg(UnitPrice) as [The Average Price]
		from [dbo].[Products]
	end
end

select * from [dbo].[Products]

