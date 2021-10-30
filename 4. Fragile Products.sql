SELECT 
	pro.ProductName AS 'Nama Produk',
	sup.CompanyName AS 'Nama Perusahaan Supplier',
	cat.CategoryName AS 'Nama Kategori',
	pro.QuantityPerUnit AS 'Jumlah quantity dalam kemasan',
	pro.UnitsInStock
FROM Products AS pro
	JOIN Suppliers AS sup ON sup.SupplierID = pro.ProductID
	JOIN Categories AS cat ON cat.CategoryID  = pro.CategoryID
	