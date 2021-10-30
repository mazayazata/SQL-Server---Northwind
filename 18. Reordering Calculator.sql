/* 18) Reordering Calculator.sql
Memesan ulang kepada supplier atau proses reorder product-product yang ingin dijual, sudah
merupakan rutinitas. Alangkah baiknya apabila database kita memiliki fungsi untuk menghitung total
seluruh biaya yang harus dikeluarkan untuk membeli ulang semua stock yang ingin di reorder lagi.
Buatlah function untuk menghitung total seluruh biaya reorder untuk semua product di dalam
database.
Reorder adalah jumlah barang/unit yang akan dipesan lagi. Di sini di-asumsikan unit price juga
merupakan harga pembelian. Fungsi ini tidak memiliki parameter apa pun.*/

CREATE FUNCTION REORDER()
RETURNS MONEY AS
BEGIN
	DECLARE @jumlahBarang AS INT
	DECLARE @TotalHarga AS MONEY


	SELECT @jumlahBarang = SUM(prod.UnitsInStock), @TotalHarga = SUM(prod.UnitPrice)
	FROM Products AS prod

	RETURN @jumlahBarang * @TotalHarga

END
