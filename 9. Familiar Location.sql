SELECT emp.Country AS [Negara Employee], DataSupp.Country AS [Negara Supplier], DataSupp.[Kontak Supplier], CONCAT(emp.FirstName,'',emp.LastName) AS [Nama Lengkap], DataSupp.Phone AS [Telp. Supplier], emp.HomePhone AS [Telp.Employee]
FROM Employees AS emp
	JOIN (SELECT sup.ContactName AS [Kontak Supplier], sup.Phone, sup.Country
	FROM Suppliers AS sup) AS DataSupp ON DataSupp.Country = emp.Country
