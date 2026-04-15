-- CASE WHEN Example
-- Description: Classify customers into spending tiers
-- based on total purchase amount.

SELECT
	c.CustomerId,
	c.FirstName || ' ' || c.LastName AS CustomerName,
	SUM(il.UnitPrice * il.Quantity) AS TotalSpent,
	CASE
		WHEN SUM(il.UnitPrice * il.Quantity) >= 45 THEN 'Premium'
		WHEN SUM(il.UnitPrice * il.Quantity) >= 40 THEN 'Gold'
		WHEN SUM(il.UnitPrice * il.Quantity) >= 35 THEN 'Silver'
		ELSE 'Standard'
	END AS SpendingTier	
FROM Customer AS c
INNER JOIN Invoice AS i
	ON c.CustomerId = i.CustomerId
INNER JOIN InvoiceLine AS il
	ON i.InvoiceId = il.InvoiceId
GROUP BY
	c.CustomerId,
	c.FirstName,
	c.LastName
ORDER BY
	TotalSpent DESC;


-- CASE WHEN Example
-- Description: Classify invoices by total value into spending categories.

SELECT
	InvoiceId,
	CustomerId,
	Total AS InvoiceTotal,
	CASE
		WHEN Total >= 15 THEN 'High Value'
		WHEN Total >= 10 THEN 'Medium Value'
		ELSE 'Low Value'
	END AS InvoiceCategory
FROM Invoice
ORDER BY
	Total DESC;


-- CASE WHEN Example
-- Description: Classify countries by sales performance
-- based on total revenue generated.

SELECT
	BillingCountry,
	SUM(Total) AS TotalSales,
	CASE
		WHEN SUM(Total) >= 100 THEN 'Top Market'
		WHEN SUM(Total) >= 50 THEN 'Strong Market'
		ELSE 'Developing Market'
	END AS SalesCategory
FROM Invoice
GROUP BY
	BillingCountry
ORDER BY
	TotalSales DESC;


-- CASE WHEN Example
-- Description: Segment customers based on spending and purchase frequency
-- using multi-condition behavioral classification.

SELECT
	c.CustomerId,
	c.FirstName || ' ' || c.LastName AS CustomerName,
	SUM(il.UnitPrice * il.Quantity) AS TotalSpent,
	COUNT(DISTINCT i.InvoiceId) AS TotalInvoices,
	CASE
		WHEN SUM(il.UnitPrice * il.Quantity) >= 40 
        AND COUNT(DISTINCT i.InvoiceId) >= 5 THEN 'Loyal High-Value'
		WHEN SUM(il.UnitPrice * il.Quantity) >= 40 THEN 'High-Value'
		WHEN COUNT(DISTINCT i.InvoiceId) >= 5 THEN 'Frequent Buyer'
		ELSE 'Standard Customer'
	END AS CustomerSegment
FROM Customer AS c
INNER JOIN Invoice AS i
	ON c.CustomerId = i.CustomerId
INNER JOIN InvoiceLine AS il
	ON i.InvoiceId = il.InvoiceId
GROUP BY
	c.CustomerId,
	c.FirstName,
	c.LastName
ORDER BY
	TotalSpent DESC;