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