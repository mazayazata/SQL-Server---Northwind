SELECT TOP 1
	ship.CompanyName AS 'Nama Perusahaan',
	SUM(od.Quantity)
FROM Shippers AS ship
	JOIN Orders ON Orders.ShipVia = ship.ShipperID
	JOIN [Order Details] AS od ON od.OrderID = Orders.OrderID
GROUP BY ship.CompanyName
ORDER BY SUM(od.Quantity) DESC