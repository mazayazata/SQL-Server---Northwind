CREATE TYPE [OrderEmp] AS TABLE(
	empID INT NOT NULL,
	OrderYear DATE
)

CREATE FUNCTION dbo.BonusPerYear(@empID AS INT, @tes AS dbo.[OrderEmp] READONLY)
RETURNS MONEY AS
BEGIN
	DECLARE @BonusPerYear AS MONEY
	DECLARE @quantity AS INT
	DECLARE @UnitPrice AS MONEY
	DECLARE @hasil AS MONEY

	SELECT @quantity = [Order Details].Quantity, @UnitPrice = [Order Details].UnitPrice
	FROM [Order Details]
		JOIN Orders AS ord ON ord.OrderID = [Order Details].OrderID
		JOIN Employees AS emp ON emp.EmployeeID = ord.EmployeeID
	WHERE emp.EmployeeID = @empID

	SET @BonusPerYear = ((@Quantity*@UnitPrice) * 0.1)

	SELECT @hasil = SUM(@BonusPerYear)
	FROM Orders
		JOIN [OrderEmp] AS oe ON oe.OrderYear = Orders.OrderDate

	RETURN @hasil
END

DECLARE @Bonus AS dbo.[OrderEmp]

INSERT INTO @Bonus(empID, OrderYear)
VALUES (3, '1996-07-04 00:00:00.000')

SELECT dbo.BonusPerYear(1, @Bonus)