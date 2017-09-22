-- 1. Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
SELECT * FROM Customer
WHERE NOT Country="US"
-- 2. Provide a query only showing the Customers from Brazil.
SELECT * FROM Customer
WHERE Country="Brazil"
-- 3. Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
SELECT customer.FirstName, customer.LastName, invoice.InvoiceId, invoice.InvoiceDate, invoice.BillingCountry
FROM Customer customer
INNER JOIN  Invoice invoice on customer.CustomerId = invoice.CustomerId
WHERE invoice.BillingCountry = "Brazil"
-- 4. Provide a query showing only the Employees who are Sales Agents.
SELECT * FROM Employee
WHERE Title = "Sales Support Agent"
-- 5. Provide a query showing a unique list of billing countries from the Invoice table.
SELECT DISTINCT BillingCountry FROM Invoice
-- 6. Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
SELECT i.InvoiceId, c.CustomerId, e.FirstName, e.LastName
FROM Employee e, Customer c, Invoice i
WHERE e.EmployeeId = c.SupportRepId
AND c.customerId = i.customerId
ORDER BY i.InvoiceId
-- 7. Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
SELECT e.FirstName || ' ' || e.LastName AS SalesAgentName, i.Total, c.FirstName, c.LastName, c.Country
FROM Invoice i, Customer c, Employee e
WHERE i.CustomerID = c.CustomerId
AND c.SupportRepId = e.EmployeeId
ORDER BY SalesAgentName
-- 8. How many Invoices were there in 2009 and 2011? What are the respective total sales for each of those years?
SELECT COUNT(*) AS InvoiceTotal
FROM Invoice
WHERE InvoiceDate LIKE ('2009%')
OR InvoiceDate LIKE ('2011%')
-- 9. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
SELECT COUNT(*) AS ItemsTotal
FROM InvoiceLine
WHERE InvoiceId = 37
-- 10. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice.
SELECT InvoiceId, count(*) AS ItemsPerInvoice
FROM InvoiceLine
GROUP BY InvoiceId
-- 11. Provide a query that includes the track name with each invoice line item.
SELECT il.InvoiceLineId,  t.Name
FROM InvoiceLine il, Track t
WHERE il.TrackId = t.TrackId
-- 12. Provide a query that includes the purchased track name AND artist name with each invoice line item.
SELECT il.InvoiceLineId, t.Name AS TrackName, a.Name AS ArtistName
FROM Track t, InvoiceLine il, Artist a, Album al
WHERE t.TrackId = il.TrackId
AND al.ArtistId = a.ArtistId
AND il.TrackId = t.TrackId
-- 13. Provide a query that shows the # of invoices per country.
SELECT COUNT(*) AS InvoiceTotal, BillingCountry
FROM Invoice
GROUP BY BillingCountry

-- 14. Provide a query that shows the total number of tracks in each playlist. The Playlist name should be included on the resultant table.
SELECT COUNT(pt.PlaylistId) AS TotalTracks, p.name
FROM Playlist p, PlaylistTrack pt
WHERE p.PlaylistId = pt.PlaylistId
GROUP BY p.PlaylistId
-- 15. Provide a query that shows all the Tracks, but displays no IDs. The resultant table should include the Album name, Media type and Genre.
SELECT a.Title AS AlbumName, g.Name AS Genre,  mt.Name As MediaType
FROM Album a, Genre g, MediaType mt, Track t
WHERE a.AlbumId = t.AlbumId
AND g.GenreId = t.GenreId
AND mt.MediaTypeId = t.MediaTypeId
-- 16. Provide a query that shows all Invoices but includes the # of invoice line items.
-- 17. Provide a query that shows total sales made by each sales agent.
-- 18. Which sales agent made the most in sales in 2009?
-- 19. Which sales agent made the most in sales in 2010?
-- 20. Which sales agent made the most in sales over all?
-- 21. Provide a query that shows the # of customers assigned to each sales agent.
-- 22. Provide a query that shows the total sales per country. Which country's customers spent the most?
-- 23. Provide a query that shows the most purchased track of 2013.
-- 24. Provide a query that shows the top 5 most purchased tracks over all.
-- 25. Provide a query that shows the top 3 best selling artists.
-- 26. Provide a query that shows the most purchased Media Type.
-- 27. Provide a query that shows the number tracks purchased in all invoices that contain more than one genre.
