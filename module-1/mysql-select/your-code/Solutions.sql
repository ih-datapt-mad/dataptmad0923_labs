
-- Challenge 1
select a.au_id as "AUTHOR ID", a.au_lname as "LAST NAME", a.au_fname as "FIRST NAME", t.title  as "TITLE", p.pub_name  as "PUBLISHER"
from authors as a join titleauthor as ta 
	on a.au_id = ta.au_id 
	join titles as t on t.title_id = ta.title_id 
	join publishers as p on t.pub_id = p.pub_id
order by a.au_id;

-- Challenge 2
select a.au_id as "AUTHOR ID", a.au_lname as "LAST NAME", a.au_fname as "FIRST NAME", p.pub_name  as "PUBLISHER", COUNT(t.title_id) as "TITLE COUNT"
from authors as a join titleauthor as ta 
	on a.au_id = ta.au_id 
	join titles as t on t.title_id = ta.title_id 
	join publishers as p on t.pub_id = p.pub_id
group by a.au_id, p.pub_id 
order by COUNT(t.title_id) desc;

-- Challenge 3

select a.au_id as "AUTHOR ID", a.au_lname as "LAST NAME", a.au_fname as "FIRST NAME", SUM(s.qty) as "TOTAL"
from authors as a join titleauthor as ta 
	on a.au_id = ta.au_id 
	join titles as t on t.title_id = ta.title_id 
	join sales as s on s.title_id = t.title_id
group by a.au_id
order by SUM(s.qty) desc
limit 3;

-- Challenge 4

select a.au_id as "AUTHOR ID", a.au_lname as "LAST NAME", a.au_fname as "FIRST NAME", SUM(s.qty) as "TOTAL"
from authors as a join titleauthor as ta 
	on a.au_id = ta.au_id 
	join titles as t on t.title_id = ta.title_id 
	join sales as s on s.title_id = t.title_id
group by a.au_id
order by SUM(s.qty) desc
limit 23;



