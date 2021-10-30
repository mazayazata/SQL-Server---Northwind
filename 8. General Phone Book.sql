DECLARE @kategori1 VARCHAR(50) = 'Employee'
DECLARE @kategori2 VARCHAR(50) = 'Supplier'
DECLARE @kategori3 VARCHAR(50) = 'Customer'
SELECT CONCAT(emp.FirstName,'',emp.LastName) AS [Nama Entitas], emp.HomePhone AS [Nomor Telepon], @kategori1 AS Kategori
FROM Employees AS emp
UNION
SELECT sup.CompanyName AS [Nama Entitas], sup.Phone [Nomor Telepon], @kategori2 AS Kategori
FROM Suppliers AS sup
UNION
SELECT cus.CompanyName AS [Nama Entitas], cus.Phone [Nomor Telepon], @kategori3 AS Kategori
FROM Customers AS cus
ORDER BY [Nama Entitas] DESC







