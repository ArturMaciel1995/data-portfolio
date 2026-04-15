-- GROUP BY + HAVING Example
-- Description: Summarize purchases for high-value customers,
-- filtering customers with total spending above 40.

SELECT
	c.CustomerId,
	c.FirstName || ' ' || c.LastName AS CustomerName,
	SUM(il.Quantity) AS TotalItemsPurchased,
	SUM(il.UnitPrice * il.Quantity) AS TotalSpent
FROM Customer AS c
INNER JOIN Invoice AS i
	ON c.CustomerId = i.CustomerId
INNER JOIN InvoiceLine AS il
	ON i.InvoiceId = il.InvoiceId
GROUP BY
	c.CustomerId,
	c.FirstName,
	c.LastName
HAVING SUM(il.UnitPrice * il.Quantity) > 40
ORDER BY
	TotalSpent DESC;


-- GROUP BY Example
-- Description: Count total invoices per customer,
-- ordered by customers with the highest number of purchases.

SELECT
	c.CustomerId,
	c.FirstName || ' ' || c.LastName AS CustomerName,
	COUNT(i.InvoiceId) AS TotalInvoicesComo 
FROM Customer AS c
INNER JOIN Invoice AS i
	ON c.CustomerId = i.CustomerId
GROUP BY
	c.CustomerId,
	c.FirstName,
	c.LastName
ORDER BY
	TotalInvoices DESC;


-- GROUP BY Example
-- Description: Summarize total sales and invoice count by billing country,
-- ordered by highest revenue-generating countries.

SELECT
	BillingCountry,
	COUNT(*) AS TotalInvoices,
	SUM(Total) AS TotalSales
FROM Invoice
GROUP BY
	BillingCountry
ORDER BY
	TotalSales DESC;


-- GROUP BY Example
-- Description: Calculate average invoice value per customer,
-- ordered by highest average purchase value.

SELECT
	c.CustomerId,
	c.FirstName || ' ' || c.LastName AS CustomerName,
	AVG(i.Total) AS AverageInvoiceValue
FROM Customer AS c
INNER JOIN Invoice AS i
	ON c.CustomerId = i.CustomerId
GROUP BY
	c.CustomerId,
	c.FirstName,
	c.LastName
ORDER BY
	AverageInvoiceValue DESC;