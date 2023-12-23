-- CHECK CREATE TABLES
SELECT *
FROM Cars c;   -- c es un alias de la tabla. Puede ponerse 'Cars as c', o sin el 'as'

SELECT count(*) as cnt   -- contar el número de registros que tiene 
FROM Cars as c;

SELECT *   -- contar el número de registros que tiene 
FROM Customers as cus;

SELECT *   -- contar el número de registros que tiene 
FROM SalesPersons as s;

SELECT *   -- contar el número de registros que tiene 
FROM Invoices as inv;
