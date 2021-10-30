/* 17) Expensive Showoff.sql
Setiap supplier ingin membanggakan product termahalnya. Tampilkan list setiap perusahaan suplier
dengan product atau product-productnya dengan harga paling mahal di perusahaan dia (harus harga
nomor 1 paling mahal, apabila perusahaan memiliki 2 atau lebih macam product dengan harga
termahal, kedua product harus ditunjukan). Tampilkan nama product dan harga productnya.
Selain itu kita akan mempresentasikan laporannya dari product yang termahal ke yang termurah,
apabila ada product dengan harga yang sama, data akan diurutkan secara ascending berdasarkan
nama product. Setiap perusahaan juga ingin tahu ranking perusahaan masing-masing untuk
pertandingan ini, oleh karena itu berikan rank dalam number untuk setiap perusahaan, bukan untuk
setiap product.*/


--------------untuk menampilkan ranking perusahaan--------------------------

SELECT sup.CompanyName, MAX(prod.UnitPrice) AS HargaTertinggi,
	RANK() OVER (ORDER BY MAX(prod.UnitPrice) DESC) AS RankPerusahaan
FROM dbo.Products AS prod
	JOIN Suppliers AS sup ON sup.SupplierID = prod.SupplierID
GROUP BY sup.CompanyName
ORDER BY RankPerusahaan

