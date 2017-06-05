USE trainee
GO


CREATE PROCEDURE [dbo].[sp_manage_trainee]
 @manage_type    AS TINYINT  
-- manage_type 1 = insert pop-information, 2 = delete cars without owner
AS
	BEGIN

	IF (@manage_type  = 1)
	BEGIN 
		INSERT INTO [dbo].[Customer] VALUES ('pop',21)
	END

	ELSE IF (@manage_type  = 2)
	BEGIN
	  DELETE FROM Car WHERE [customer_id] is null
	END
END
