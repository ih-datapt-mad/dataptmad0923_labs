-- Challenge 1
SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', t2.title AS 'TITLE', p.pub_name AS 'PUBLISHER'
FROM authors a
JOIN (SELECT au_id, title_id FROM titleauthor) t ON
a.au_id = t.au_id
JOIN (SELECT title_id, title, pub_id FROM titles) t2 ON
t.title_id = t2.title_id
JOIN (SELECT pub_id, pub_name FROM publishers) p ON
t2.pub_id = p.pub_id;

-- Challenge 2

SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', p.pub_name AS 'PUBLISHER', count(*) AS 'TITLE_COUNT'
FROM authors a
JOIN (SELECT au_id, title_id FROM titleauthor) t ON
a.au_id = t.au_id
JOIN (SELECT title_id, title, pub_id FROM titles) t2 ON
t.title_id = t2.title_id
JOIN (SELECT pub_id, pub_name FROM publishers) p ON
t2.pub_id = p.pub_id
GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name;

-- Challenge 3

SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', sum(s.qty) AS 'TOTAL'
FROM authors a
JOIN (SELECT au_id, title_id FROM titleauthor) t ON
a.au_id = t.au_id
JOIN sales s ON
t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY TOTAL DESC
LIMIT 3;

-- Challenge 4

SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', IFNULL(SUM(s.qty), 0) AS 'TOTAL'
FROM authors a
LEFT JOIN (SELECT au_id, title_id FROM titleauthor) t ON
a.au_id = t.au_id
LEFT JOIN sales s ON
t.title_id = s.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY TOTAL DESC;


