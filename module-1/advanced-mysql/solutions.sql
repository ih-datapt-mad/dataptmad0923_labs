---------------------------------
---------- CHALLENGE 1 ----------
---------------------------------
-- Step 1: Calculate the royalty of each sale for each author and the advance for each author and publication
	-- Variables to SELECT:
		-- TITLE ID
		-- AUTHOR ID - the ID of the author
		-- ADVANCE

SELECT titles.title_id AS TITLE ID, authors.au_id AS AUTHOR ID, 
	(titles.advance * titleauthor.royaltyper / 100) AS ADVANCE,
	(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS SALES ROYALTY
FROM authors
	LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
	LEFT JOIN titles ON  titleauthor.title_id = titles.title_id
	LEFT JOIN sales ON titles.title_id = sales.title_id;


-- Step 2: Aggregate the total royalties for each title and author
	-- Variables to SELECT:
		-- Title ID
		-- Author ID
		-- Aggregated royalties of each title for each author

SELECT   -- Q2 = QUERY STEP 2
    Q2.title_id AS TITLE ID,
    Q2.au_id AS AUTHOR ID,
    SUM(Q2.SALES ROYALTY) AS ROYALTIES TITLE   -- Royalties of each title for each author
FROM (
    -- SUBQUERY STEP 1
    SELECT titles.title_id, authors.au_id,
        (titles.advance * titleauthor.royaltyper / 100) AS ADVANCE,
        (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS SALES ROYALTY
    FROM authors
    	LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
    	LEFT JOIN titles ON titleauthor.title_id = titles.title_id
    	LEFT JOIN sales ON titles.title_id = sales.title_id
) as Q2
GROUP BY Q2.title_id, Q2.au_id;


-- Step 3: Calculate the total profits of each author
	-- Variables to SELECT:
		-- Author ID
		-- Profits of each author by aggregating the advance and total royalties of each title	

SELECT   -- Q3 = QUERY STEP 3
    Q3.au_id,
    SUM(Q3.ROYALTIES TITLE) AS PROFIT   -- Royalties of each title for each author
FROM (

	-- SUBQUERY STEP 2 (Q2 = QUERY STEP 2)
	SELECT Q2.title_id, Q2.au_id,
    	SUM(Q2.SALES ROYALTY) AS ROYALTIES TITLE   -- Royalties of each title for each author
	FROM (

    	-- SUBQUERY STEP 1
    	SELECT titles.title_id, authors.au_id,
        	(titles.advance * titleauthor.royaltyper / 100) AS ADVANCE,
        	(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS SALES ROYALTY
    	FROM authors
    		LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
    		LEFT JOIN titles ON titleauthor.title_id = titles.title_id
    		LEFT JOIN sales ON titles.title_id = sales.title_id
	) AS Q2
	GROUP BY Q2.title_id, Q2.au_id

) AS Q3
GROUP BY Q3.au_id
ORDER BY profit DESC
LIMIT 3;


-- TESTING: With this query you can extract the au_id (coming from subquery 2) that are repeated and verify that the corresponding records are being added in subquery 3.
SELECT 
	test.au_id
FROM (

	-- SUBQUERY STEP 2 (Q2 = QUERY STEP 2)
	SELECT Q2.title_id, Q2.au_id,
    	SUM(Q2.SALES ROYALTY) AS ROYALTIES TITLE-AUTHOR   -- Royalties of each title for each author
	FROM (

    	-- SUBQUERY STEP 1
    	SELECT titles.title_id, authors.au_id,
        	(titles.advance * titleauthor.royaltyper / 100) AS ADVANCE,
        	(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS SALES ROYALTY
    	FROM authors
    		LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
    		LEFT JOIN titles ON titleauthor.title_id = titles.title_id
    		LEFT JOIN sales ON titles.title_id = sales.title_id
	) AS Q2
	GROUP BY Q2.title_id, Q2.au_id
) AS test
GROUP BY test.au_id
HAVING COUNT(test.au_id) != 1;



---------------------------------
---------- CHALLENGE 2 ----------
---------------------------------
-- Step 1: create temporary table with the result of the step 1
CREATE TEMPORARY TABLE royalty_advance AS
SELECT titles.title_id AS 'TITLE ID', authors.au_id AS 'AUTHOR ID', 
	(titles.advance * titleauthor.royaltyper / 100) AS 'ADVANCE',
	(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS 'SALES ROYALTY'
FROM authors
	LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
	LEFT JOIN titles ON  titleauthor.title_id = titles.title_id
	LEFT JOIN sales ON titles.title_id = sales.title_id;
-- I will check if the table is created correctly
SELECT * FROM royalty_advance


-- Step 2: create a temporary table with the result of the step 2 using the temporary table from the step 1
CREATE TEMPORARY TABLE agg_royalties AS
SELECT royalty_advance.'TITLE ID', royalty_advance.'AUTHOR ID', SUM(royalty_advance.'SALES ROYALTY') AS 'ROYALTIES TITLE-AUTHOR'
FROM royalty_advance
GROUP BY royalty_advance.'TITLE ID', royalty_advance.'AUTHOR ID';
-- I will check if the table is created correctly
SELECT * FROM agg_royalties


-- Step 3: create a temporary table with the result of the step 3 using the temporary table from the step 2
CREATE TEMPORARY TABLE total_profit AS
SELECT agg_royalties.'AUTHOR ID', SUM(agg_royalties.'ROYALTIES TITLE-AUTHOR') AS 'PROFIT'
FROM agg_royalties
GROUP BY agg_royalties.'AUTHOR ID'
ORDER BY 'PROFIT' DESC
LIMIT 3;
-- I will check if the table is created correctly
SELECT * FROM total_profit


-- Create permanent table
CREATE TABLE most_profiting_authors AS
SELECT *
FROM total_profit;