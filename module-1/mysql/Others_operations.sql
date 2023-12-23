-- OTHER OPERATIONS
--SELECT *
--FROM Customers INNER JOIN Invoices ON Customers.ID = Invoices.Customer
--WHERE Customers.Country = 'Spain'

SELECT *
FROM Cars INNER JOIN Invoices ON Cars.ID = Invoices.Car
WHERE Cars.Manufacturer = 'Toyota'

SELECT *
FROM Invoices
WHERE "Date" = '20180822'

SELECT *
FROM Orders AS o1
WHERE OrderDate =
(SELECT MAX(OrderDate) FROM Orders AS o2
WHERE o1.Customers = a2.customer)

WITH max_values AS  (SELECT max('Date') AS d FROM Invoices)
SELECT *
FROM Invoices
WHERE 'Date' = (SELECT d FROM max_values)

select * from information_schema.tables