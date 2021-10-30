SELECT pvt.ID AS Jabatan, [Eastern],[Southern],[Western]
FROM (
	SELECT emp.Title AS tittle, reg.RegionDescription AS region, emp.Title AS ID
	FROM Employees AS emp
		JOIN EmployeeTerritories AS et ON et.EmployeeID = emp.EmployeeID
		JOIN Territories AS ter ON ter.TerritoryID = et.TerritoryID
		JOIN Region AS reg ON reg.RegionID = ter.RegionID
) AS et
PIVOT(
	COUNT(et.tittle) FOR et.region IN([Northern],[Eastern],[Southern],[Western])
) AS pvt