--CHALLENGE 1

SELECT 
	a.au_id as "AUTHOR ID",
	a.au_lname as "LAST NAME",
	a.au_fname as "FIRST NAME",
	t2.title as "TITLE",
	p.pub_name as PUBLISHER
FROM
	authors a
	INNER JOIN titleauthor t on t.au_id = a.au_id 
	INNER JOIN titles t2 on t2.title_id = t.title_id 
	INNER JOIN publishers p on p.pub_id = t2.pub_id 
	

--CHALLENGE 2

SELECT  
	a.au_id as "AUTHOR ID",
	a.au_lname as "LAST NAME",
	a.au_fname as "FIRST NAME",
	p.pub_name as PUBLISHER,
	count(t2.title) as "TITLE COUNT"
FROM
	authors a
	INNER JOIN titleauthor t on t.au_id = a.au_id 
	INNER JOIN titles t2 on t2.title_id = t.title_id 
	INNER JOIN publishers p on p.pub_id = t2.pub_id 
GROUP BY 3
ORDER BY 5 DESC

--CHECKING CHALLENGE 2
SELECT
	COUNT(a.au_id),
	COUNT(t2.title) as "TITLE COUNT"
FROM
	authors a
	INNER JOIN titleauthor t on t.au_id = a.au_id 
	INNER JOIN titles t2 on t2.title_id = t.title_id 
	INNER JOIN publishers p on p.pub_id = t2.pub_id 

--CHALLENGE 3
	
SELECT  
	a.au_id as "AUTHOR ID",
	a.au_lname as "LAST NAME",
	a.au_fname as "FIRST NAME",
	sum(s.qty) as "TOTAL"
FROM
	authors a
	INNER JOIN titleauthor t on t.au_id = a.au_id 
	INNER JOIN titles t2 on t2.title_id = t.title_id 
	INNER JOIN sales s  on s.title_id = t2.title_id 
GROUP BY 1
ORDER BY 4 DESC
LIMIT 3

--CHALLENGE 4
SELECT  
	a.au_id as "AUTHOR ID",
	a.au_lname as "LAST NAME",
	a.au_fname as "FIRST NAME",
	COALESCE(sum(s.qty),0) as "TOTAL"
FROM
	authors a
	LEFT JOIN titleauthor t on t.au_id = a.au_id 
	LEFT JOIN titles t2 on t2.title_id = t.title_id 
	LEFT JOIN sales s  on s.title_id = t2.title_id 
GROUP BY 1
ORDER BY 4 DESC


