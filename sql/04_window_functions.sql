-- WINDOW FUNCTION Example
-- Description: Rank customers based on total spending using RANK().

SELECT
	c.CustomerId,
	c.FirstName || ' ' || c.LastName AS CustomerName,
	SUM(i.Total) AS TotalSpent,
	RANK() OVER(
		ORDER BY SUM(i.Total) DESC
		) AS SpendingRank
FROM Customer AS c
INNER JOIN Invoice AS i
	ON c.CustomerId = i.CustomerId
GROUP BY
	c.CustomerId,
	c.FirstName,
	c.LastName;


-- WINDOW FUNCTION Example
-- Description: Compare RANK() and ROW_NUMBER() for customer ranking
-- based on total spending.

SELECT
	c.CustomerId,
	c.FirstName || ' ' || c.LastName AS CustomerName,
	SUM(i.Total) AS TotalSpent,
	RANK() OVER(
		ORDER BY SUM(i.Total) DESC
		) AS SpendingRank,
	ROW_NUMBER() OVER(
		ORDER BY SUM(i.Total) DESC
		) AS RowNumber
FROM Customer AS c
INNER JOIN Invoice AS i
	ON c.CustomerId = i.CustomerId
GROUP BY
	c.CustomerId,
	c.FirstName,
	c.LastName;


-- WINDOW FUNCTION Example
-- Description: Rank customers within each country based on total spending.

SELECT
	c.CustomerId,
	c.FirstName || ' ' || c.LastName AS CustomerName,
	c.Country,
	SUM(i.Total) AS TotalSpent,
	RANK() OVER(
		PARTITION BY Country
		ORDER BY SUM(i.Total) DESC
	) AS CountryRank
FROM Customer AS c
INNER JOIN Invoice AS i
	ON c.CustomerId = i.CustomerId
GROUP BY
	c.CustomerId,
	c.FirstName,
	c.LastName,
	c.Country;


-- WINDOW FUNCTION Example
-- Description: Compare each invoice with the previous one per customer
-- using LAG() to analyze spending trends.

SELECT
	CustomerId,
	InvoiceId,
	InvoiceDate,
	Total,
	LAG(Total) OVER(
		PARTITION BY CustomerId
		ORDER BY InvoiceDate
	) AS PreviousTotal,
	Total - LAG(Total) OVER(
		PARTITION BY CustomerId
		ORDER BY InvoiceDate
	) AS Difference
FROM Invoice;