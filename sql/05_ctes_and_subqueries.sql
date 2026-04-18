-- CTE Example
-- Description: Calculate total spending per customer and filter
-- high-value customers using a Common Table Expression (CTE).

WITH cte_totspent AS (
	SELECT
		c.CustomerId,
		c.FirstName || ' ' || c.LastName AS CustomerName,
		SUM(i.Total) AS TotalSpent
	FROM Customer AS c
	INNER JOIN Invoice AS i
		ON c.CustomerId = i.CustomerId
	GROUP BY
		c.CustomerId,
		c.FirstName,
		c.LastName
)

SELECT 
	CustomerId,
	CustomerName,
	TotalSpent
FROM cte_totspent
WHERE TotalSpent > 40
ORDER BY
	TotalSpent DESC;


-- CTE + Window Function Example
-- Description: Identify the top-spending customer in each country
-- by calculating total spending and ranking customers within each country.

WITH totcountry AS (
	SELECT
		c.Country,
		c.FirstName || ' ' || c.LastName AS CustomerName,
		SUM(i.Total) AS TotalSpent,
		ROW_NUMBER() OVER(
			PARTITION BY c.Country
			ORDER BY SUM(i.Total) DESC
		) AS RowNumber
	FROM Customer AS c
	INNER JOIN Invoice AS i
		ON c.CustomerId = i.CustomerId
	GROUP BY
		c.Country,
		c.FirstName,
		c.LastName
)

SELECT
	Country,
	CustomerName,
	TotalSpent,
	RowNumber
FROM totcountry
WHERE RowNumber = 1
ORDER BY
	Country;


-- Subquery Example
-- Description: Calculate total spending per customer and filter those whose
-- spending exceeds the average total spent across all customers using a nested subquery.

SELECT
    c.CustomerId,
    c.FirstName || ' ' || c.LastName AS CustomerName,
    SUM(i.Total) AS TotalSpent
FROM Customer AS c
INNER JOIN Invoice AS i
    ON c.CustomerId = i.CustomerId
GROUP BY
    c.CustomerId,
    c.FirstName,
    c.LastName
HAVING SUM(i.Total) > (
    SELECT AVG(customer_totals.TotalSpent)
    FROM (
        SELECT
            CustomerId,
            SUM(Total) AS TotalSpent
        FROM Invoice
        GROUP BY CustomerId
    ) AS customer_totals
)
ORDER BY
    TotalSpent DESC;


-- Subquery Example
-- Description: Retrieve invoices where the amount exceeds the customer's
-- average invoice value using a correlated subquery.

SELECT
    i.CustomerId,
    i.InvoiceId,
    i.Total
FROM Invoice AS i
WHERE i.Total > (
    SELECT
        AVG(Total)
    FROM Invoice
    WHERE CustomerId = i.CustomerId
)
ORDER BY
    i.CustomerId;