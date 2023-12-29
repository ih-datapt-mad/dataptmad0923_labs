
-- Challenge 1

SELECT sq.author, sum(sq.advance), sum(sq.sales_royalty),  sum(sq.advance + sq.sales_royalty) as "Total income"
FROM 
	(SELECT a.au_id as author_id, CONCAT(a.au_fname, " ", a.au_lname) as author, t.title, AVG(t.advance * ta.royaltyper / 100) AS advance, SUM(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) as sales_royalty  
	FROM sales AS s JOIN titles as t ON s.title_id = t.title_id
		JOIN titleauthor as ta on ta.title_id = t.title_id 
		JOIN authors as a on a.au_id = ta.au_id 
	GROUP BY t.title_id, a.au_id) as sq
GROUP BY sq.author_id
ORDER BY "Total income" DESC
LIMIT 3;

-- Challenge 2(alternaitve way)

CREATE temp	TABLE profit AS
SELECT a.au_id as author_id, CONCAT(a.au_fname, " ", a.au_lname) as author, t.title, AVG(t.advance * ta.royaltyper / 100) AS advance, SUM(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) as sales_royalty  
FROM sales AS s JOIN titles as t ON s.title_id = t.title_id
	JOIN titleauthor as ta on ta.title_id = t.title_id 
	JOIN authors as a on a.au_id = ta.au_id 
GROUP BY t.title_id, a.au_id

SELECT sq.author, sum(sq.advance), sum(sq.sales_royalty),  sum(sq.advance + sq.sales_royalty) as "Total income"
FROM profit as sq
GROUP BY sq.author_id
ORDER BY "Total income" DESC
LIMIT 3;

-- Challenge 3

CREATE TABLE most_profit_authors AS
SELECT sq.auThor_id, sum(sq.advance + sq.sales_royalty) as profits
FROM profit as sq
GROUP BY sq.author_id
ORDER BY "Total income" DESC
LIMIT 3;

