USE OpsMetricsDB;
GO

/* ============================
   Revenue by Product
   ============================ */
SELECT 
    p.ProductName,
    SUM(oi.Quantity * oi.UnitPrice) AS TotalRevenue
FROM OrderItems oi
JOIN Products p ON oi.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalRevenue DESC;
GO


/* ============================
   Low Stock Monitoring
   ============================ */
/*
If no rows are returned, it means inventory
has not dropped below the threshold yet.
Run after placing orders or increase threshold
for demonstration purposes.
*/

SELECT 
    ProductName,
    StockQuantity
FROM Products
WHERE StockQuantity < 50;
GO


/* ============================
   Low Stock (Demo Mode)
   ============================ */
SELECT 
    ProductName,
    StockQuantity
FROM Products
WHERE StockQuantity < 200;
GO


/* ============================
   Customer Order History
   ============================ */
SELECT 
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.OrderStatus
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
ORDER BY o.OrderDate DESC;
GO
