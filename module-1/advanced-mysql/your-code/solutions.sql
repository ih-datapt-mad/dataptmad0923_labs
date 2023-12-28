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
    ta.title_id AS TITLE_ID,
    a.au_id AS AUTHOR_ID,
    (SELECT SUM(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100)
     FROM sales s
     WHERE s.title_id = ta.title_id
     GROUP BY s.title_id) 
     AS TOTAL_ROYALTIES
FROM
    titleauthor ta 
JOIN 
    authors a ON ta.au_id = a.au_id
JOIN
    titles t ON ta.title_id = t.title_id;

-- Step 3
SELECT
    a.au_id AS AUTHOR_ID,
    SUM(total_royalty_advance) AS TOTAL_PROFITS
FROM
    authors a
JOIN
    titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN (
    SELECT
        ta.au_id,
        ta.title_id,
        SUM(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100 +
            t.advance * ta.royaltyper / 100) AS total_royalty_advance
    FROM
        titleauthor ta
    JOIN
        titles t ON ta.title_id = t.title_id
    JOIN
        sales s ON t.title_id = s.title_id
    GROUP BY
        ta.au_id, ta.title_id
) AS subquery ON a.au_id = subquery.au_id
GROUP BY
    a.au_id
ORDER BY
    TOTAL_PROFITS DESC
LIMIT 3;

-- Challenge 2. Alternative Solution

