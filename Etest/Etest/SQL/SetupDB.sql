-- Create Database
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'ExamDB')
BEGIN
    CREATE DATABASE ExamDB;
END
GO

USE ExamDB;
GO

-- Create Products Table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
BEGIN
    CREATE TABLE Products (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        Name NVARCHAR(200) NOT NULL,
        Category NVARCHAR(100),
        Price DECIMAL(18, 2) NOT NULL,
        Quantity INT NOT NULL,
        CreatedAt DATETIME DEFAULT GETDATE(),
        UpdatedAt DATETIME DEFAULT GETDATE()
    );
END
GO
