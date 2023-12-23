
---------------------------
-- CHALLENGE 1
	-- Variables to SELECT:
		-- AUTHOR ID - the ID of the author
		-- LAST NAME - author last name
		-- FIRST NAME - author first name
		-- TITLE - name of the published title
		-- PUBLISHER - name of the publisher where the title was published

-- QUERY CHALLENGE 1
SELECT authors.au_id as 'AUTHOR ID', au_lname as 'LAST NAME', au_fname as 'FIRST NAME', titles.title as 'TITLE', publishers.pub_name as 'PUBLISHER'
FROM authors
	JOIN titleauthor ON titleauthor.au_id = authors.au_id
	JOIN titles ON titles.title_id = titleauthor.title_id 
	JOIN publishers on publishers.pub_id = titles.pub_id;

	
---------------------------	
-- CHALLENGE 2	

-- QUERY CHALLENGE 2
SELECT authors.au_id as 'AUTHOR ID', au_lname as 'LAST NAME', au_fname as 'FIRST NAME', publishers.pub_name as 'PUBLISHER', COUNT(titles.title) AS 'TITLE COUNT'
FROM authors
	JOIN titleauthor ON titleauthor.au_id = authors.au_id
	JOIN titles ON titles.title_id = titleauthor.title_id 
	JOIN publishers on publishers.pub_id = titles.pub_id
	GROUP BY authors.au_id, au_lname, au_fname, publishers.pub_name
	ORDER BY 'TITLE COUNT' DESC;


---------------------------	
-- CHALLENGE 3
	-- Variables to SELECT:
		-- AUTHOR ID - the ID of the author
		-- LAST NAME - author last name
		-- FIRST NAME - author first name
		-- TOTAL - total number of titles sold from this author

-- QUERY CHALLENGE 3
SELECT authors.au_id as 'AUTHOR ID', au_lname as 'LAST NAME', au_fname as 'FIRST NAME', COUNT(sales.title_id) AS 'TOTAL'
FROM authors
	LEFT JOIN titleauthor ON titleauthor.au_id = authors.au_id
	LEFT JOIN titles ON titles.title_id = titleauthor.title_id 
	LEFT JOIN sales on sales.title_id = titles.title_id
GROUP BY authors.au_id, au_lname, au_fname
ORDER BY 'TOTAL' DESC
LIMIT 3;


---------------------------	
-- CHALLENGE 4
	-- Variables to SELECT:
		-- AUTHOR ID - the ID of the author
		-- LAST NAME - author last name
		-- FIRST NAME - author first name
		-- TOTAL - total number of titles sold from this author

-- QUERY CHALLENGE 4	
SELECT authors.au_id as 'AUTHOR ID', au_lname as 'LAST NAME', au_fname as 'FIRST NAME', COUNT(sales.title_id) AS 'TOTAL'
FROM authors
	LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
	LEFT JOIN titles ON  titleauthor.title_id = titles.title_id
	LEFT JOIN sales on titles.title_id = sales.title_id
GROUP BY authors.au_id, au_lname, au_fname
ORDER BY 'TOTAL' DESC
LIMIT 23;
