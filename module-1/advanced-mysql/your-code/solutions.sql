-- Challenge 1
SELECT b.AUTHOR_ID, SUM(SALES_ROYALTY) AS 'SALES_ROYALTY', SUM(ADVANCE) AS 'ADVANCE' FROM (
SELECT a.AUTHOR_ID, a.TITLE_ID, SUM(SALES_ROYALTY) AS 'SALES_ROYALTY', SUM(ADVANCE) AS 'ADVANCE' FROM (
SELECT t.au_id as 'AUTHOR_ID',
t.title_id AS 'TITLE_ID',
t2.advance * royaltyper / 100 AS 'ADVANCE',
t2.price * s.qty * t2.royalty / 100 * t.royaltyper / 100 AS 'SALES_ROYALTY'
FROM titleauthor t
JOIN (SELECT title_id, advance, price, royalty FROM titles) t2
ON t.title_id = t2.title_id
JOIN (SELECT title_id, qty FROM sales) s
ON t.title_id = s.title_id) a
GROUP BY a.AUTHOR_ID, a.TITLE_ID) b
GROUP BY b.AUTHOR_ID
ORDER BY SALES_ROYALTY, ADVANCE DESC
LIMIT 3;

-- Challenge 2

CREATE TEMPORARY TABLE temp_a AS 
SELECT t.au_id as 'AUTHOR_ID',
t.title_id AS 'TITLE_ID',
t2.advance * royaltyper / 100 AS 'ADVANCE',
t2.price * s.qty * t2.royalty / 100 * t.royaltyper / 100 AS 'SALES_ROYALTY'
FROM titleauthor t
JOIN (SELECT title_id, advance, price, royalty FROM titles) t2
ON t.title_id = t2.title_id
JOIN (SELECT title_id, qty FROM sales) s
ON t.title_id = s.title_id;


CREATE TEMPORARY TABLE temp_b AS 
SELECT a.AUTHOR_ID, a.TITLE_ID, SUM(SALES_ROYALTY) AS 'SALES_ROYALTY', SUM(ADVANCE) AS 'ADVANCE' FROM temp_a a
GROUP BY a.AUTHOR_ID, a.TITLE_ID;

CREATE TEMPORARY TABLE temp_c AS
SELECT b.AUTHOR_ID, SUM(SALES_ROYALTY) AS 'SALES_ROYALTY', SUM(ADVANCE) AS 'ADVANCE' FROM temp_b b
GROUP BY b.AUTHOR_ID
ORDER BY SALES_ROYALTY, ADVANCE DESC
LIMIT 3;

SELECT * FROM temp_c;

-- Challenge 3

SELECT AUTHOR_ID, SALES_ROYALTY + ADVANCE FROM temp_c;
