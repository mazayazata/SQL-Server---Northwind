SELECT pro.ProductName, (pro.UnitPrice*pro.UnitsInStock) AS [Total Asset]
FROM Products AS pro
WHERE Discontinued = 0
ORDER BY [Total Asset] DESC

