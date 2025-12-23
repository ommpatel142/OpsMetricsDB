USE OpsMetricsDB;
GO

CREATE OR ALTER PROCEDURE PlaceOrder
    @CustomerID INT,
    @ProductID INT,
    @Quantity INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Stock INT;
    DECLARE @UnitPrice DECIMAL(10,2);
    DECLARE @OrderID INT;

    BEGIN TRY
        BEGIN TRAN;

        SELECT
            @Stock = StockQuantity,
            @UnitPrice = UnitPrice
        FROM Products
        WHERE ProductID = @ProductID;

        IF @Stock < @Quantity
        BEGIN
            RAISERROR ('Insufficient stock', 16, 1);
        END

        INSERT INTO Orders (CustomerID, OrderStatus)
        VALUES (@CustomerID, 'Completed');

        SET @OrderID = SCOPE_IDENTITY();

        INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice)
        VALUES (@OrderID, @ProductID, @Quantity, @UnitPrice);

        UPDATE Products
        SET StockQuantity = StockQuantity - @Quantity
        WHERE ProductID = @ProductID;

        INSERT INTO InventoryTransactions (ProductID, ChangeQuantity, TransactionType)
        VALUES (@ProductID, -@Quantity, 'Order');

        INSERT INTO AuditLog (TableName, Action, Details)
        VALUES ('Orders', 'INSERT', 'Order placed successfully');

        COMMIT TRAN;
    END TRY
    BEGIN CATCH
        ROLLBACK TRAN;

        INSERT INTO AuditLog (TableName, Action, Details)
        VALUES ('Orders', 'FAILED', ERROR_MESSAGE());

        THROW;
    END CATCH
END;
GO
