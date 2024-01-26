--CHALLENGE 1
--STEP 1
SELECT 
		t.title_id as "Title ID",
		t2.au_id as "Author ID",
		t.advance *t2.royaltyper/100 as Advance,
		t.price * s.qty * t.royalty /100 * t2.royaltyper as sales_royalty
FROM
		titles t 
		LEFT JOIN titleauthor t2 on t2.title_id = t.title_id 
		LEFT JOIN sales s on s.title_id = t.title_id 
		
		
--STEP 2
SELECT 
		Title_id,
		Author_ID,
		sum(Advance) as advance,
		SUM(sales_royalty) as total_sales_royalty 
FROM(		
		SELECT 
				t.title_id,
				t2.au_id as author_id,
				t.advance *t2.royaltyper/100 as Advance,
				t.price * s.qty * t.royalty /100 * t2.royaltyper as sales_royalty
		FROM
				titles t 
				LEFT JOIN titleauthor t2 on t2.title_id = t.title_id 
				LEFT JOIN sales s on s.title_id = t.title_id 		
)as subquery
group by 1,2

--STEP 3
SELECT 
	author_id,
	advance+total_sales_royalty as profits
FROM
	(SELECT 
			Title_id,
			Author_ID,
			sum(Advance) as advance,
			SUM(sales_royalty) as total_sales_royalty 
	FROM(		
			SELECT 
					t.title_id,
					t2.au_id as author_id,
					t.advance *t2.royaltyper/100 as Advance,
					t.price * s.qty * t.royalty /100 * t2.royaltyper as sales_royalty
			FROM
					titles t 
					LEFT JOIN titleauthor t2 on t2.title_id = t.title_id 
					LEFT JOIN sales s on s.title_id = t.title_id 		
	)as subquery
	group by 1,2
) as subquery
order by 2 desc
limit 3


--CHALLENGE 2
CREATE TEMPORARY TABLE IF NOT EXISTS temp_results as
SELECT 
		t.title_id as "Title ID",
		t2.au_id as "Author ID",
		t.advance *t2.royaltyper/100 as Advance,
		t.price * s.qty * t.royalty /100 * t2.royaltyper as sales_royalty
FROM
		titles t 
		LEFT JOIN titleauthor t2 on t2.title_id = t.title_id 
		LEFT JOIN sales s on s.title_id = t.title_id 
		 
CREATE TEMPORARY TABLE IF NOT EXISTS temp_results2 as
SELECT 
		Title_id,
		Author_ID,
		sum(Advance) as advance,
		SUM(sales_royalty) as total_sales_royalty 
FROM(		
		SELECT 
				t.title_id,
				t2.au_id as author_id,
				t.advance *t2.royaltyper/100 as Advance,
				t.price * s.qty * t.royalty /100 * t2.royaltyper as sales_royalty
		FROM
				titles t 
				LEFT JOIN titleauthor t2 on t2.title_id = t.title_id 
				LEFT JOIN sales s on s.title_id = t.title_id 		
)as subquery
group by 1,2

SELECT 
	author_id,
	advance+total_sales_royalty as profits
FROM
	temp_results2 
order by 2 desc
limit 3

--CHALLENGE 3

CREATE TABLE most_profiting_authors (au_id VARCHAR(11) PRIMARY KEY,
									profits DECIMAL(10,2) NOT NULL);
INSERT INTO most_profiting_authors (au_id, profits)
SELECT
	author_id,
	advance + total_sales_royalty as profits
FROM
	temp_results2 
ORDER BY profits DESC
LIMIT 3;

--CHECKING
select * from most_profiting_authors 