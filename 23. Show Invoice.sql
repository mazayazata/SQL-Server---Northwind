CREATE FUNCTION dbo.grandTotal(@Quantity AS SMALLINT, @UnitPrice AS MONEY, @Discount AS REAL)
RETURNS MONEY AS
BEGIN
	DECLARE @GrandTotal AS MONEY
	SET @GrandTotal = (@Quantity*@UnitPrice) *  (1 - @Discount)

	RETURN @GrandTotal
END
-----------------------------------------------------------------------------------------------------------------------
ALTER PROCEDURE dbo.ShowInvoice
@OrderId AS INT
AS
BEGIN
	
	SELECT 
		FORMAT(ord.OrderDate, 'dd MMM yyy', 'id-ID') AS [Order Date], 
		cus.ContactName, CONCAT(emp.FirstName,' ',emp.LastName) AS Salesman, ord.ShipName, 
		FORMAT(ord.ShippedDate, 'dd MMM yyy', 'id-ID') AS [Ship Date],
		ot.[Total Cost]
		FROM (
		SELECT ord.OrderID, SUM(dbo.grandTotal(ordet.UnitPrice, ordet.Quantity, ordet.Discount)+ord.Freight) AS [Total Cost]
		FROM dbo.Orders AS ord
			JOIN dbo.[Order Details] AS ordet ON ord.OrderID = ordet.OrderID
		GROUP BY ord.OrderID
		) AS ot
		JOIN Orders AS ord ON ord.OrderID = ot.OrderID
		JOIN dbo.Customers AS cus ON ord.CustomerID = cus.CustomerID
		JOIN dbo.Employees AS emp ON emp.EmployeeID = ord.EmployeeID
	WHERE ord.OrderID = @OrderId

	SELECT prod.ProductName, sup.CompanyName, ordet.Quantity, ordet.UnitPrice, dbo.grandTotal(ordet.UnitPrice, ordet.Quantity, ordet.Discount) AS [Total]
	FROM dbo.Orders AS ord
		JOIN dbo.[Order Details] AS ordet ON ord.OrderID = ordet.OrderID
		JOIN Products AS prod ON prod.ProductID = ordet.ProductID
		JOIN Suppliers AS sup ON sup.SupplierID = prod.SupplierID
	WHERE ord.OrderID = @OrderId
END
---------------------------------------------------------------------------------------------------------------------------------------------
EXEC dbo.ShowInvoice
@OrderId = 10252

