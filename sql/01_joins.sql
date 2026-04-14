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
	Date(i.InvoiceDate) AS InvoiceDateOnly
FROM Customer AS c
LEFT JOIN Invoice AS i
	ON c.CustomerId = i.CustomerId
ORDER BY
	c.CustomerId;


    