use trainee
GO

------------- create procedure here -------------------------
create procedure sp_manage_trainee
@manage_type as tinyint
as
begin
	if(@manage_type = 1)
	begin
		insert into [dbo].[Customer]([customer_name],[customer_age])
		values('Nui',21) 
	end

	else 
	begin
		delete from [dbo].[Car] where customer_id is null
	end

end

------ execute -------------
exec sp_manage_trainee 1 -- insert self information
exec sp_manage_trainee 2 -- delete null car


--------- just test ----------------
select * from [dbo].[Customer]

select * from [dbo].[Car]