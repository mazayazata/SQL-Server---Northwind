/* Management ingin melihat pengalaman setiap perusahaan pengiriman (Shipper) untuk mengirim
product dengan category product tertentu, pada tahun tertentu. Management ingin melihat berapa
banyak total quantity barang (bukan jumlah order atau bukan jumlah variasi product) yang sudah dikirim
oleh perusahaan shipper pada tahun tertentu dimana dilihat dari tanggal pengirimannya. Buatlah
sebuah Stored Procedure, dimana procedure ini akan menerima 1 parameter berupa tahun yang ingin di
lihat, dan stored procedure ini akan menampilkan table dengan format seperti dibawah ini: */

CREATE PROCEDURE dbo.ShipQuantity
@year AS INT
AS
BEGIN
	SELECT pvt.ID AS [Product Category], [Speedy Express],[United Package],[Federal Shipping]
	FROM (
		SELECT ship.CompanyName AS compName, cat.CategoryName AS catName, cat.CategoryName AS ID
		FROM Shippers AS ship
			JOIN Orders AS ord ON ord.ShipVia = ship.ShipperID
			JOIN [Order Details] AS ordet ON ordet.OrderID = ord.OrderID
			JOIN Products AS prod ON prod.ProductID = ordet.ProductID
			JOIN Categories AS cat ON cat.CategoryID = prod.CategoryID	
		WHERE YEAR(ord.OrderDate) = @year 
	) AS st
	PIVOT(
		COUNT(st.catName) FOR st.compName IN([Speedy Express],[United Package],[Federal Shipping])
	) AS pvt	
END

EXEC dbo.ShipQuantity
@year = 1998