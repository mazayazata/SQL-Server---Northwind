SELECT TOP 2 cat.CategoryName, SUM(prod.UnitsInStock) AS 'Jumlah Stock Paling Sedikit'
FROM Categories AS cat
	JOIN Products AS prod ON cat.CategoryID = prod.CategoryID
GROUP BY cat.CategoryName
ORDER BY SUM(prod.UnitsInStock) ASC