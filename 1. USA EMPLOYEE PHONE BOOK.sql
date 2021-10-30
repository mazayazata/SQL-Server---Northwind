SELECT 
	CONCAT(emp.FirstName, emp.LastName) AS 'Nama Lengkap', 
	emp.TitleOfCourtesy, 
	emp.HomePhone AS 'Nomot Telepon'
FROM Employees AS emp
WHERE emp.Country = 'USA'

use Northwind;

SELECT CONCAT(emp.TitleOfCourtesy, ' ', emp.FirstName, ' ', emp.LastName) AS [Full Name], emp.HomePhone AS [Phone]
FROM dbo.Employees AS emp
WHERE emp.Country = 'USA';