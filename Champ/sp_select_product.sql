USE [NORTHWND]
GO

/****** Object:  StoredProcedure [dbo].[sq_select_product]    Script Date: 6/5/2017 6:01:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sq_select_product]
@select_type AS TINYINT
--1 => SELECT PRICE
--2 => SELECT MAX PRICE
--2 => SELECT MIN PRICE
--2 => SELECT AVR PRICE
AS 
BEGIN 
	IF(@select_type = 1)
	BEGIN
		SELECT [ProductID] AS ProductCode, [ProductName], [UnitPrice] AS Price , CAST(([UnitPrice]+([UnitPrice]*0.07)) AS FLOAT) AS PriceIncludeVAT
		FROM [dbo].[Products]
	END

	ELSE IF(@select_type = 2)
	BEGIN
		SELECT MAX([UnitPrice]) AS [The Maximum Price]
		FROM [dbo].[Products]
	END

	ELSE IF(@select_type = 3)
	BEGIN
		SELECT MIN([UnitPrice]) AS [The Minimum Price]
		FROM [dbo].[Products]
	END

	ELSE IF(@select_type = 4)
	BEGIN
		SELECT AVG([UnitPrice]) AS [The Average Price]
		FROM [dbo].[Products]
	END
END
GO


