-- =============================================
-- Database: OpsMetricsDB
-- Author: Om Patel
-- Description: Orders & Inventory Operations DB
-- =============================================

IF DB_ID('OpsMetricsDB') IS NOT NULL
    DROP DATABASE OpsMetricsDB;
GO

CREATE DATABASE OpsMetricsDB;
GO

USE OpsMetricsDB;
GO

-- =========================
-- Customers
-- =========================
CREATE TABLE Customers (
    CustomerID INT IDENTITY PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- =========================
-- Products
-- =========================
CREATE TABLE Products (
    ProductID INT IDENTITY PRIMARY KEY,
    ProductName NVARCHAR(100) NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL CHECK (UnitPrice > 0),
    StockQuantity INT NOT NULL CHECK (StockQuantity >= 0),
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- =========================
-- Orders
-- =========================
CREATE TABLE Orders (
    OrderID INT IDENTITY PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATETIME DEFAULT GETDATE(),
    OrderStatus NVARCHAR(20) CHECK (OrderStatus IN ('Pending','Completed','Cancelled')),
    CONSTRAINT FK_Orders_Customers
        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- =========================
-- OrderItems
-- =========================
CREATE TABLE OrderItems (
    OrderItemID INT IDENTITY PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    UnitPrice DECIMAL(10,2) NOT NULL CHECK (UnitPrice > 0),
    CONSTRAINT FK_OrderItems_Orders
        FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT FK_OrderItems_Products
        FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- =========================
-- Inventory Transactions
-- =========================
CREATE TABLE InventoryTransactions (
    TransactionID INT IDENTITY PRIMARY KEY,
    ProductID INT NOT NULL,
    ChangeQuantity INT NOT NULL,
    TransactionType NVARCHAR(20),
    TransactionDate DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Inventory_Product
        FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- =========================
-- Audit Log
-- =========================
CREATE TABLE AuditLog (
    AuditID INT IDENTITY PRIMARY KEY,
    TableName NVARCHAR(50),
    Action NVARCHAR(50),
    ActionDate DATETIME DEFAULT GETDATE(),
    Details NVARCHAR(255)
);