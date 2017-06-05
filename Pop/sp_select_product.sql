USE NORTHWND
GO

CREATE PROCEDURE [dbo].[sp_select_product]
 @manage_type   AS TINYINT  
 --manage_type 
 --1 = query
 --2 = Max Price
 --3 = Min Price
 --4 = Avg Price
AS
BEGIN

	IF (@manage_type = 1)
	BEGIN 
		SELECT	[ProductID] AS 'ProductCode' ,
				[ProductName],
				cast([UnitPrice] AS FLOAT ) AS 'Price',
				cast([UnitPrice]*1.07 AS FLOAT ) AS 'PriceIncludeVAT'
		FROM [dbo].[Products]
	END

	ELSE IF (@manage_type = 2)
	BEGIN
		SELECT	cast(max([UnitPrice]) AS FLOAT) AS 'The Maximum Price'		
		FROM [dbo].[Products]

	END

	ELSE IF (@manage_type = 3)
	BEGIN
		SELECT	cast(min([UnitPrice]) AS FLOAT) AS 'The Minimum Price'		
		FROM [dbo].[Products]

	END

	ELSE IF (@manage_type = 4)
	BEGIN
		SELECT	cast(avg([UnitPrice]) AS FLOAT) AS 'The Average Price'		
		FROM [dbo].[Products]
	END
END

