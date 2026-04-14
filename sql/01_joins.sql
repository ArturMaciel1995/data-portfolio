-- INNER JOIN Example
-- Description: Retrieve customer invoices with purchased item quantities,
-- ordered by highest quantity per customer.

SELECT
	c.CustomerId,
	c.FirstName || ' ' || c.LastName AS CustomerName,
	i.InvoiceId,
	il.Quantity,
	il.UnitPrice
FROM Customer AS c
INNER JOIN Invoice AS i
	ON c.CustomerId = i.CustomerId
INNER JOIN InvoiceLine AS il
	ON i.InvoiceId = il.InvoiceId
ORDER BY
	c.CustomerId,
	il.Quantity DESC;


-- LEFT JOIN Example
-- Description: Retrieve all customers including those without invoices,
-- displaying invoice date formatted as date only.

SELECT
	c.CustomerId,
	c.FirstName || ' ' || c.LastName AS CustomerName,
	i.InvoiceId,
	DATE(i.InvoiceDate) AS InvoiceDateOnly
FROM Customer AS c
LEFT JOIN Invoice AS i
	ON c.CustomerId = i.CustomerId
ORDER BY
	c.CustomerId;


-- SELF JOIN Example
-- Description: Retrieve employees with their respective managers
-- using a hierarchical self-referencing employee table.
-- Note: This example uses a fictional employee table created
-- for demonstration purposes.

SELECT 
	e.FirstName || ' ' || e.LastName AS EmployeeName, 
	e.Position, 
	m.FirstName || ' ' || m.LastName AS ManagerName
FROM employee AS e
LEFT JOIN employee AS m
	ON e.ManagerId = m.EmployeeId
ORDER BY
	e.EmployeeId;


-- Note:
-- SQLite does not natively support RIGHT JOIN or FULL OUTER JOIN.
-- Therefore, these join types are not included in this file.
