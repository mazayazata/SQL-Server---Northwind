SELECT 
	pro.ProductName,
	AVG(pro.UnitPrice) AS 'Harga Rata-Rata'
FROM Products AS pro
	JOIN Suppliers AS sup ON sup.SupplierID = pro.SupplierID
WHERE
	sup.Country = 'Germany' or sup.Country = 'Spain' or sup.Country = 'Sweden' or sup.Country = 'Italy' or sup.Country = 'Norwey' or sup.Country = 'Denmark' or sup.Country = 'Netherlands' or sup.Country = 'Finland' or sup.Country = 'France'
GROUP BY pro.ProductName
HAVING AVG(pro.UnitPrice) < 50
ORDER BY AVG(pro.UnitPrice)

