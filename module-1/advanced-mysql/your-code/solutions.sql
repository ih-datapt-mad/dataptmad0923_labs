-- Challenge 1
-- Step 1
SELECT 
ta.title_id AS TITLE_ID,
a.au_id AS AUTHOR_ID,
t.advance * ta.royaltyper / 100 AS ADVANCE,
t.price * s.qty * t.royalty / 100 * ta.royaltyper/100 AS ROYALTY
FROM
titleauthor ta 
JOIN 
authors a ON ta.au_id = a.au_id
JOIN
titles t ON ta.title_id = t.title_id
JOIN
sales s ON t.title_id = s.title_id;

-- Step 2
SELECT
    subquery.AUTHOR_ID AS AUTHOR_ID,
    subquery.TITLE_ID AS TITLE_ID,
    SUM(subquery.TOTAL_ROYALTIES) AS TOTAL_ROYALTIES
FROM
    (SELECT
        ta.au_id AS AUTHOR_ID,
        ta.title_id AS TITLE_ID,
        SUM(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) AS TOTAL_ROYALTIES
    FROM
        titleauthor ta
    JOIN
        titles t ON ta.title_id = t.title_id
    JOIN
        sales s ON t.title_id = s.title_id
    GROUP BY
        ta.au_id, t.title_id) AS subquery 
GROUP BY
    subquery.AUTHOR_ID, subquery.TITLE_ID;

-- Step 3
SELECT
    subquery.AUTHOR_ID AS AUTHOR_ID,
    SUM(subquery.TOTAL_ROYALTIES) + SUM(TOTAL_ADVANCE) AS TOTAL_PROFITS
FROM
    (SELECT
        ta.au_id AS AUTHOR_ID,
        ta.title_id,
        SUM(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) AS TOTAL_ROYALTIES,
		SUM(t.advance * ta.royaltyper / 100) AS TOTAL_ADVANCE
    FROM
        titleauthor ta
    JOIN
        titles t ON ta.title_id = t.title_id
    JOIN
        sales s ON t.title_id = s.title_id
    GROUP BY
        ta.au_id, t.title_id) AS subquery 
GROUP BY
    subquery.AUTHOR_ID
ORDER BY
    TOTAL_PROFITS DESC
LIMIT 3;

-- Challenge 2

-- Step 1
SELECT 
ta.title_id AS TITLE_ID,
a.au_id AS AUTHOR_ID,
t.advance * ta.royaltyper / 100 AS ADVANCE,
t.price * s.qty * t.royalty / 100 * ta.royaltyper/100 AS ROYALTY
FROM
titleauthor ta 
JOIN 
authors a ON ta.au_id = a.au_id
JOIN
titles t ON ta.title_id = t.title_id
JOIN
sales s ON t.title_id = s.title_id;

-- Step 2
SELECT
    dt.TITLE_ID,
    dt.AUTHOR_ID,
    dt.TOTAL_ROYALTIES
FROM
    (SELECT 
        ta.title_id AS TITLE_ID,
        a.au_id AS AUTHOR_ID,
        SUM(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) AS TOTAL_ROYALTIES
    FROM
        titleauthor ta 
    JOIN 
        authors a ON ta.au_id = a.au_id
    JOIN
        titles t ON ta.title_id = t.title_id
    JOIN
        sales s ON t.title_id = s.title_id
    GROUP BY 
        AUTHOR_ID, TITLE_ID) dt;

-- Step 3
SELECT
    dt.AUTHOR_ID,
    SUM(dt.TOTAL_PROFITS) AS TOTAL_PROFITS
FROM
    (SELECT 
        ta.title_id AS TITLE_ID,
        a.au_id AS AUTHOR_ID,
        (t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) +
            (t.advance * ta.royaltyper / 100) AS TOTAL_PROFITS
    FROM
        titleauthor ta 
    JOIN 
        authors a ON ta.au_id = a.au_id
    JOIN
        titles t ON ta.title_id = t.title_id
    JOIN
        sales s ON t.title_id = s.title_id
    GROUP BY 
        AUTHOR_ID, TITLE_ID,TOTAL_PROFITS) dt
GROUP BY
    AUTHOR_ID
ORDER BY
    TOTAL_PROFITS DESC
LIMIT 3;

-- Challenge 3

-- Creating table
CREATE TABLE most_profiting_authors (
    au_id VARCHAR(11) NOT NULL,
    profits INT NOT NULL
);

-- Inserting data into the table
INSERT INTO most_profiting_authors (au_id, profits)
SELECT
    dt.AUTHOR_ID,
    SUM(dt.TOTAL_PROFITS) AS TOTAL_PROFITS
FROM
    (SELECT 
        ta.title_id AS TITLE_ID,
        a.au_id AS AUTHOR_ID,
        SUM(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) +
            (t.advance * ta.royaltyper / 100) AS TOTAL_PROFITS
    FROM
        titleauthor ta 
    JOIN 
        authors a ON ta.au_id = a.au_id
    JOIN
        titles t ON ta.title_id = t.title_id
    JOIN
        sales s ON t.title_id = s.title_id
    GROUP BY 
        AUTHOR_ID, TITLE_ID) dt
GROUP BY
    AUTHOR_ID;

-- Visualizing the data
SELECT * FROM most_profiting_authors
ORDER BY profits DESC
LIMIT 5;



        
        
        
        
        
        
