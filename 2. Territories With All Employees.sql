SELECT CONCAT(emp.FirstName, emp.LastName) AS 'Nama Lengkap', terr.TerritoryDescription
FROM Employees AS emp
	FULL JOIN EmployeeTerritories AS empter ON empter.EmployeeID = emp.EmployeeID
	FULL JOIN Territories AS terr ON empter.TerritoryID = terr.TerritoryID