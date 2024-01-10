-- Challenge 1 - Who Have Published What At Where?
SELECT
    a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    ti.title AS TITLE,
    pub.pub_name AS PUBLISHER
FROM
    authors a
RIGHT JOIN
    titleauthor ta ON a.au_id = ta.au_id
INNER JOIN
    titles ti ON ta.title_id = ti.title_id
INNER JOIN
    publishers pub ON ti.pub_id = pub.pub_id;
    
-- Challenge 2 - Who Have Published How Many At Where?
SELECT
    a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    pub.pub_name AS PUBLISHER,
    COUNT(ti.title_id) AS TITLE_COUNT
FROM
    authors a
RIGHT JOIN
    titleauthor ta ON a.au_id = ta.au_id
INNER JOIN
    titles ti ON ta.title_id = ti.title_id
INNER JOIN
    publishers pub ON ti.pub_id = pub.pub_id
GROUP BY
    a.au_id, pub.pub_id
ORDER BY
    AUTHOR_ID DESC;

-- Challenge 3 - Best Selling Authors
SELECT
    a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    SUM(s.qty) AS TOTAL
FROM
    authors a
JOIN
    titleauthor ta ON a.au_id = ta.au_id
JOIN
    titles t ON ta.title_id = t.title_id
JOIN
    sales s ON t.title_id = s.title_id
GROUP BY
    a.au_id, a.au_lname, a.au_fname
ORDER BY
    TOTAL DESC
LIMIT 3;

-- Challenge 4 - Best Selling Authors Ranking
SELECT
    a.au_id AS AUTHOR_ID,
    a.au_lname AS LAST_NAME,
    a.au_fname AS FIRST_NAME,
    COALESCE(SUM(s.qty), 0) AS TOTAL
FROM
    authors a
LEFT JOIN
    titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN
    titles t ON ta.title_id = t.title_id
LEFT JOIN
    sales s ON t.title_id = s.title_id
GROUP BY
    a.au_id, a.au_lname, a.au_fname
ORDER BY
    TOTAL DESC;

