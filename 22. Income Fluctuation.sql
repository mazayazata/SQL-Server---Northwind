CREATE FUNCTION dbo.grandTotal(@Quantity AS SMALLINT, @UnitPrice AS MONEY, @Discount AS REAL)
RETURNS MONEY AS
BEGIN
	DECLARE @GrandTotal AS MONEY
	SET @GrandTotal = (@Quantity*@UnitPrice) *  (1-@Discount)

	RETURN @GrandTotal
END

SELECT ord.OrderDate, SUM(dbo.grandTotal(ordet.UnitPrice, ordet.Quantity, ordet.Discount)) AS [Total Income], 
	 SUM(dbo.grandTotal(ordet.UnitPrice, ordet.Quantity, ordet.Discount)) - LAG(SUM(dbo.grandTotal(ordet.UnitPrice, ordet.Quantity, ordet.Discount))) OVER (ORDER BY ord.OrderDate) AS [Selisih Pendapatan]
FROM dbo.Orders AS ord
	JOIN dbo.[Order Details] AS ordet ON ord.OrderID = ordet.OrderID
GROUP BY ord.OrderDate
ORDER BY ord.OrderDate ASC