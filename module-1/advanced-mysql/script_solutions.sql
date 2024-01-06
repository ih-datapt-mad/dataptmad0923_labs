--- Challenge 01: Who are the top 3 most profiting authors? 

--- En la tabla sales un título puede aparecer varias veces
--- Aunque tenga varias ventas, el anticipo debe calcularse una sola vez por titulo
--- En la solución hay que resumir los beneficios por cada autor: todos los anticipios, 
--- una vez para cada título y todas las regalías en cada venta

--- PASOS:
--- 1. Calcula el canon de cada venta para cada utor y el anticipo para cada autor y publicación. 
--- 2. Utilizando el resultado anterior, agregar las regalías totales para cada título y autor. 
--- 3. Utilizando el resultado anterior, calcular las ganancias totales de cada autor agregando los anticipos y regalías totales de cada título. 

--- STEP 1: Calcular la regalía de cada venta para cada autor y el anticipio por cada autor y publicación. 

SELECT t.title_id,
t.au_id AS author_id, 
a.au_lname AS "Last Name", 
a.au_fname AS "First Name", 
t2.advance * t.royaltyper / 100 AS advance, 
t2.price * s.qty * t2.royalty / 100 * t.royaltyper / 100 AS sales_royalty
FROM titleauthor t 
INNER JOIN titles t2 ON t.title_id = t2.title_id 
INNER JOIN authors a ON t.au_id = a.au_id 
INNER JOIN sales s ON t.title_id = s.title_id; 


--- STEP 2: Sumar las regalías totales para cada autor y publicación. 

SELECT 
    summary.title_id,
    summary.author_id,
    summary.au_lname AS "Last Name",
    summary.au_fname AS "First Name",
    SUM(summary.sales_royalty) AS total_royalties
FROM (
    SELECT t.title_id,
	t.au_id AS author_id, 
	a.au_lname, 
	a.au_fname, 
	t2.advance * t.royaltyper / 100 AS advance, 
	t2.price * s.qty * t2.royalty / 100 * t.royaltyper / 100 AS sales_royalty
	FROM titleauthor t 
	INNER JOIN titles t2 ON t.title_id = t2.title_id 
	INNER JOIN authors a ON t.au_id = a.au_id 
	INNER JOIN sales s ON t.title_id = s.title_id
) summary
GROUP BY 
    summary.title_id, summary.author_id;
    
--- STEP 3: Calcular los beneficios totales por autor

SELECT 
    au_id,
    au_lname AS "Last Name",
    au_fname AS "First Name",
    SUM(advance + total_royalties) AS profits
FROM (
    SELECT 
        summary.au_id,
        summary.au_lname,
        summary.au_fname,
        summary.title_id,
        summary.advance,
        SUM(summary.sales_royalty) AS total_royalties
    FROM (
        SELECT 
            t.title_id,
            a.au_id,
            a.au_lname,
            a.au_fname,
            t2.advance * t.royaltyper / 100 AS advance,
            t2.price * s.qty * t2.royalty / 100 * t.royaltyper / 100 AS sales_royalty
        FROM 
            titleauthor t 
        INNER JOIN 
            authors a ON t.au_id = a.au_id
        INNER JOIN 
            titles t2 ON t.title_id = t2.title_id
        INNER JOIN 
            sales s ON t.title_id = s.title_id
    ) summary
    GROUP BY 
        summary.title_id, summary.au_id
) step2
GROUP BY 
    au_id, au_lname, au_fname
ORDER BY 
    profits DESC
LIMIT 3;


--- Challenge 02: Alternative with temporary tables 


CREATE TEMPORARY TABLE challenge1 AS  
SELECT t.title_id,
t.au_id AS author_id, 
a.au_lname AS "Last Name", 
a.au_fname AS "First Name", 
t2.advance * t.royaltyper / 100 AS advance, 
t2.price * s.qty * t2.royalty / 100 * t.royaltyper / 100 AS sales_royalty
FROM titleauthor t 
INNER JOIN titles t2 ON t.title_id = t2.title_id 
INNER JOIN authors a ON t.au_id = a.au_id 
INNER JOIN sales s ON t.title_id = s.title_id;



CREATE TEMPORARY TABLE challenge02 AS
SELECT 
    title_id,
    author_id,
    "Last Name", 
    "First Name",    
    SUM(sales_royalty) AS total_royalties
FROM challenge1 
GROUP BY 
    title_id, author_id;
   
   
SELECT * 
FROM challenge02 
ORDER BY total_royalties DESC
LIMIT 3;
   

--- Challenge 03: Create a permanent table

CREATE TABLE most_profiting_authors AS 
SELECT 
    au_id,
    au_lname AS "Last Name",
    au_fname AS "First Name",
    SUM(advance + total_royalties) AS profits
FROM (
    SELECT 
        summary.au_id,
        summary.au_lname,
        summary.au_fname,
        summary.title_id,
        summary.advance,
        SUM(summary.sales_royalty) AS total_royalties
    FROM (
        SELECT 
            t.title_id,
            a.au_id,
            a.au_lname,
            a.au_fname,
            t2.advance * t.royaltyper / 100 AS advance,
            t2.price * s.qty * t2.royalty / 100 * t.royaltyper / 100 AS sales_royalty
        FROM 
            titleauthor t 
        INNER JOIN 
            authors a ON t.au_id = a.au_id
        INNER JOIN 
            titles t2 ON t.title_id = t2.title_id
        INNER JOIN 
            sales s ON t.title_id = s.title_id
    ) summary
    GROUP BY 
        summary.title_id, summary.au_id
) step2
GROUP BY 
    au_id, au_lname, au_fname
ORDER BY 
    profits DESC
LIMIT 3;

SELECT * 
FROM most_profiting_authors; 