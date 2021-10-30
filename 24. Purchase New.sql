ALTER PROCEDURE dbo.PurchaseNew
@cusID AS INT,
@empID AS INT,
@shipmentName AS VARCHAR(40),
@cartTable AS dbo.Cart READONLY
AS
BEGIN
	BEGIN TRY
	BEGIN TRANSACTION

		INSERT INTO dbo.Orders(CustomerID, EmployeeID, OrderDate, ShipName)
		VALUES(@cusID, @empID, GETDATE(), @shipmentName)
		
		DECLARE @currentOrdersId AS INT = SCOPE_IDENTITY()
		
		INSERT INTO dbo.[Order Details](OrderID, ProductID, UnitPrice, Quantity)
		SELECT @currentOrdersId, crt.ProductID, prod.UnitPrice, crt.Quantity
		FROM @cartTable AS crt
			JOIN dbo.Products AS prod ON prod.ProductID = crt.ProductID
		
		UPDATE Products SET UnitsInStock = 
		 
	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT 'Ada yang error'
		ROLLBACK TRANSACTION
	END CATCH
END

DECLARE @keranjangKu AS dbo.Cart

INSERT INTO @keranjangKu(Quantity, ProductID)
VALUES(12,11),(4,2),(2,3)

EXEC dbo.PurchaseNew
	@cusID = 10263,
	@empID = 9,
	@shipmentName = 'Ernst Handel',
	@cartTable = @keranjangKu