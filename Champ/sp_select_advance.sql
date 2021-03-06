USE [NORTHWND]
GO
/****** Object:  StoredProcedure [dbo].[sq_select_advance]    Script Date: 6/5/2017 5:39:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sq_select_advance]
@select_type AS TINYINT
AS
BEGIN
	IF(@select_type = 1)
	BEGIN
		SELECT [dbo].[Customers].[CustomerID], [dbo].[Customers].[CompanyName], [dbo].[Customers].[ContactName], SUM(([Quantity]*[UnitPrice])) AS [TotalOrderPrice]
		FROM [dbo].[Customers] INNER JOIN  [dbo].[Orders] ON [dbo].[Customers].[CustomerID] = [dbo].[Orders].[CustomerID] 
		INNER JOIN [dbo].[Order Details] ON [dbo].[Orders].OrderID  = [dbo].[Order Details].OrderID
		GROUP BY [dbo].[Customers].[CustomerID], [dbo].[Customers].[CompanyName],[dbo].[Customers].[ContactName]
		ORDER BY [dbo].[Customers].[CustomerID], [dbo].[Customers].[CompanyName]
	END

	ELSE IF(@select_type = 2)
	BEGIN
	SELECT MAX(A.[TotalOrderPrice]) AS [Maximum is] FROM
		(SELECT [dbo].[Customers].[CustomerID], [dbo].[Customers].[CompanyName], [dbo].[Customers].[ContactName], SUM(([Quantity]*[UnitPrice])) AS [TotalOrderPrice]
		FROM [dbo].[Customers] INNER JOIN  [dbo].[Orders] ON [dbo].[Customers].[CustomerID] = [dbo].[Orders].[CustomerID] 
		INNER JOIN [dbo].[Order Details] ON [dbo].[Orders].OrderID  = [dbo].[Order Details].OrderID
		GROUP BY [dbo].[Customers].[CustomerID], [dbo].[Customers].[CompanyName],[dbo].[Customers].[ContactName])A
	END

	ELSE IF(@select_type = 3)
	BEGIN
	SELECT MIN(A.[TotalOrderPrice]) AS [Maximum is] FROM
		(SELECT [dbo].[Customers].[CustomerID], [dbo].[Customers].[CompanyName], [dbo].[Customers].[ContactName], SUM(([Quantity]*[UnitPrice])) AS [TotalOrderPrice]
		FROM [dbo].[Customers] INNER JOIN  [dbo].[Orders] ON [dbo].[Customers].[CustomerID] = [dbo].[Orders].[CustomerID] 
		INNER JOIN [dbo].[Order Details] ON [dbo].[Orders].OrderID  = [dbo].[Order Details].OrderID
		GROUP BY [dbo].[Customers].[CustomerID], [dbo].[Customers].[CompanyName],[dbo].[Customers].[ContactName])A
	END

	ELSE IF(@select_type = 4)
	BEGIN
	SELECT AVG(A.[TotalOrderPrice]) AS [Maximum is] FROM
		(SELECT [dbo].[Customers].[CustomerID], [dbo].[Customers].[CompanyName], [dbo].[Customers].[ContactName], SUM(([Quantity]*[UnitPrice])) AS [TotalOrderPrice]
		FROM [dbo].[Customers] INNER JOIN  [dbo].[Orders] ON [dbo].[Customers].[CustomerID] = [dbo].[Orders].[CustomerID] 
		INNER JOIN [dbo].[Order Details] ON [dbo].[Orders].OrderID  = [dbo].[Order Details].OrderID
		GROUP BY [dbo].[Customers].[CustomerID], [dbo].[Customers].[CompanyName],[dbo].[Customers].[ContactName])A
	END 

	ELSE IF(@select_type = 5)
	BEGIN
	SELECT SUM(A.[TotalOrderPrice]) AS [Maximum is] FROM
		(SELECT [dbo].[Customers].[CustomerID], [dbo].[Customers].[CompanyName], [dbo].[Customers].[ContactName], SUM(([Quantity]*[UnitPrice])) AS [TotalOrderPrice]
		FROM [dbo].[Customers] INNER JOIN  [dbo].[Orders] ON [dbo].[Customers].[CustomerID] = [dbo].[Orders].[CustomerID] 
		INNER JOIN [dbo].[Order Details] ON [dbo].[Orders].OrderID  = [dbo].[Order Details].OrderID
		GROUP BY [dbo].[Customers].[CustomerID], [dbo].[Customers].[CompanyName],[dbo].[Customers].[ContactName])A
	
	END
END