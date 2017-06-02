
USE MASTER


IF db_id('trainee') is not null
   BEGIN
		DROP DATABASE trainee;
		CREATE DATABASE trainee;
   END
ELSE
   CREATE DATABASE trainee;
GO

USE [trainee];
GO

IF ( SELECT object_id('dbo.Customer') ) > 0
   DROP TABLE dbo.Customer
CREATE TABLE dbo.Customer
    (
    customer_id   int           IDENTITY(1,1) PRIMARY KEY,
	customer_name nvarchar(255) NULL,
    customer_age  int           NULL
    );

IF ( SELECT object_id('dbo.Car') ) > 0
    DROP TABLE dbo.Car
    CREATE TABLE dbo.Car
    (
    car_id   int             IDENTITY(1,1) PRIMARY KEY,
	car_name nvarchar(255)   NULL ,
    car_price  int           NULL ,
	customer_id int			 NULL
    );


--ALTER TABLE dbo.Car
--    ADD CONSTRAINT PK_Car
--    PRIMARY KEY NONCLUSTERED(car_id)

--ALTER TABLE dbo.Customer
--    ADD CONSTRAINT PK_Customer
--    PRIMARY KEY NONCLUSTERED(customer_id)

ALTER TABLE dbo.Car ADD
    CONSTRAINT FK_Customer_Car
    FOREIGN KEY(customer_id) REFERENCES dbo.Customer(customer_id)


USE trainee
GO

INSERT INTO [dbo].[Car]
           ([car_name]
           ,[car_price]
           ,[customer_id])
     VALUES
           ('BMW', 120000,NULL),
		   ('BMW 2', 10000,NULL),
		   ('BENZ', 80000,NULL),
		   ('BENZ 2', 15000,NULL),
		   ('Porche', 85000,NULL),
		   ('Porche 2', 70000,NULL),
		   ('Lambo', 750000,NULL)		   
GO

USE [train]
GO

INSERT INTO [dbo].[Customer]
           ([customer_name]
           ,[customer_age])
     VALUES
           ('Robert',42),
		   ('Selena',39),
		   ('Jackson',30),
		   ('Sulu',22)
GO

