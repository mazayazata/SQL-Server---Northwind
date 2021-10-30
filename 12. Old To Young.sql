SELECT CONCAT(emp.FirstName, ' ', emp.LastName) AS [Nama Lengkap],
	CONCAT(DATEDIFF(year, emp.BirthDate, GETDATE()) , ' Tahun') AS [Umur]
FROM Employees AS emp
ORDER BY [Umur] DESC