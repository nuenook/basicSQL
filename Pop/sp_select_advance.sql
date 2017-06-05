--sp_select_advance

USE NORTHWND
Go

CREATE PROCEDURE [dbo].[sp_select_advance]  
	@manage_type   AS TINYINT  
 --manage_type 
 --1 = TotalPrice
 --2 = Max TotalPrice
 --3 = Min TotalPrice
 --4 = Avg TotalPrice
 --5 = Summary TotalPrice

AS
BEGIN

	IF (@manage_type = 1)
	BEGIN 
		SELECT c.[CustomerID],[CompanyName],[ContactName],cast(sum([UnitPrice]*[Quantity]) AS FLOAT) AS 'TotalPrice'
		FROM [dbo].[Customers] c join [dbo].[Orders] o ON c.[CustomerID]=o.CustomerID
		join [dbo].[Order Details] od ON o.OrderID=od.OrderID
		GROUP BY c.[CustomerID],c.[CompanyName],[ContactName]
		ORDER BY c.[CompanyName]
	END

	ELSE IF (@manage_type = 2)
	BEGIN
		SELECT cast(round(max(TotalPrice),1) AS FLOAT) AS 'Maximum TotalPrice'
		FROM(
			SELECT sum([UnitPrice]*[Quantity]) AS 'TotalPrice'
			FROM [dbo].[Customers] c join [dbo].[Orders] o ON c.[CustomerID]=o.CustomerID
			join [dbo].[Order Details] od ON o.OrderID=od.OrderID
			GROUP BY c.[CustomerID],c.[CompanyName],[ContactName]
		) t 

	END

	ELSE IF (@manage_type = 3)
	BEGIN
		SELECT cast(round(min(TotalPrice),1) AS FLOAT) AS 'Minimum TotalPrice'
		FROM(
			SELECT sum([UnitPrice]*[Quantity]) AS 'TotalPrice'
			FROM [dbo].[Customers] c join [dbo].[Orders] o ON c.[CustomerID]=o.CustomerID
			join [dbo].[Order Details] od ON o.OrderID=od.OrderID
			GROUP BY c.[CustomerID],c.[CompanyName],[ContactName]
		) t 

	END

	ELSE IF (@manage_type = 4)
	BEGIN
		SELECT cast(round(avg(TotalPrice),2) AS FLOAT) AS 'Average TotalPrice'
		FROM(
			SELECT sum([UnitPrice]*[Quantity]) AS 'TotalPrice'
			FROM [dbo].[Customers] c join [dbo].[Orders] o ON c.[CustomerID]=o.CustomerID
			join [dbo].[Order Details] od ON o.OrderID=od.OrderID
			GROUP BY c.[CustomerID],c.[CompanyName],[ContactName]
		) t 
	END

	ELSE IF (@manage_type = 5)
	BEGIN
		SELECT cast(round(sum(TotalPrice),0) AS FLOAT) AS 'Summary'
		FROM(
			SELECT sum([UnitPrice]*[Quantity]) AS 'TotalPrice'
			FROM [dbo].[Customers] c join [dbo].[Orders] o ON c.[CustomerID]=o.CustomerID
			join [dbo].[Order Details] od ON o.OrderID=od.OrderID
			GROUP BY c.[CustomerID],c.[CompanyName],[ContactName]
		) t 
	END
END
