SELECT ord.OrderID, FORMAT(ord.OrderDate,'d MMMM yyy','id-ID') AS [Tanggal Order], tabel.Jumlah AS [Total Jenis Product]
FROM (
	SELECT ordet.OrderID, COUNT(pro.ProductID) AS Jumlah
	FROM [Order Details] AS ordet
		JOIN Products AS pro ON pro.ProductID = ordet.ProductID
	GROUP BY ordet.OrderID
	) AS tabel
	JOIN Orders AS ord ON ord.OrderID = tabel.OrderID
ORDER BY ord.OrderDate
