USE [trainee]
GO

/****** Object:  StoredProcedure [dbo].[sp_manage_Customer]    Script Date: 6/5/2017 6:02:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_manage_Customer]
  @customer_name AS NVARCHAR(50) = null
, @customer_age  AS INT = null
, @manage_type   AS TINYINT  
-- manage_type 0 = INSERT, 1 = DELETE
AS
BEGIN
IF (@manage_type = 0)
BEGIN 
INSERT INTO [dbo].[Customer]
   ([customer_name]
   ,[customer_age])
 VALUES
   (@customer_name
   ,@customer_age)
END

ELSE IF (@manage_type = 1)
BEGIN
  DELETE FROM [dbo].[Customer]
  WHERE [customer_name] = @customer_name
END


END
GO


