-- Challenge 1 - Most Profiting Authors

-- Step 1: Calculate the royalty of each sale for each author and the advance for each author and publication
SELECT
    t.title_id AS Title_ID,
    ta.au_id AS Author_ID,
    (t.advance * ta.royaltyper / 100) AS Advance,
    (s.qty * t.price * t.royalty / 100 * ta.royaltyper / 100) AS Sales_Royalty
FROM
    titleauthor ta
JOIN
    titles t ON ta.title_id = t.title_id
JOIN
    sales s ON t.title_id = s.title_id;

-- Step 2: Aggregate the total royalties for each title and author
SELECT
    Title_ID,
    Author_ID,
    SUM(Sales_Royalty) AS Aggregated_Royalties
FROM (
    
    SELECT
        t.title_id AS Title_ID,
        ta.au_id AS Author_ID,
        (t.advance * ta.royaltyper / 100) AS Advance,
        (s.qty * t.price * t.royalty / 100 * ta.royaltyper / 100) AS Sales_Royalty
    FROM
        titleauthor ta
    JOIN
        titles t ON ta.title_id = t.title_id
    JOIN
        sales s ON t.title_id = s.title_id
) AS Subquery_Step1
GROUP BY
    Title_ID, Author_ID;

-- Step 3: Calculate the total profits of each author
SELECT
    Author_ID,
    SUM(Advance) + SUM(Aggregated_Royalties) AS Total_Profits
FROM (
    -- Subquery from Step 2
    SELECT
        Title_ID,
        Author_ID,
        SUM(Sales_Royalty) AS Aggregated_Royalties,
        MAX(Advance) AS Advance  -- Utiliza MAX para obtener el anticipo único para cada título y autor
    FROM (
        -- Subquery from Step 1
        SELECT
            t.title_id AS Title_ID,
            ta.au_id AS Author_ID,
            (t.advance * ta.royaltyper / 100) AS Advance,
            (s.qty * t.price * t.royalty / 100 * ta.royaltyper / 100) AS Sales_Royalty
        FROM
            titleauthor ta
        JOIN
            titles t ON ta.title_id = t.title_id
        JOIN
            sales s ON t.title_id = s.title_id
    ) AS Subquery_Step1
    GROUP BY
        Title_ID, Author_ID
) AS Subquery_Step2
GROUP BY
    Author_ID
ORDER BY
    Total_Profits DESC
LIMIT 3;

-- Challenge 2 - Alternative Solution

-- Step 1: Calculate the royalty of each sale for each author and the advance for each author and publication
CREATE TEMPORARY TABLE Step1Table AS
SELECT
    t.title_id AS Title_ID,
    ta.au_id AS Author_ID,
    (t.advance * ta.royaltyper / 100) AS Advance,
    (s.qty * t.price * t.royalty / 100 * ta.royaltyper / 100) AS Sales_Royalty
FROM
    titleauthor ta
JOIN
    titles t ON ta.title_id = t.title_id
JOIN
    sales s ON t.title_id = s.title_id;

-- Step 2: Aggregate the total royalties for each title and author
CREATE TEMPORARY TABLE Step2Table AS
SELECT
    Title_ID,
    Author_ID,
    SUM(Sales_Royalty) AS Aggregated_Royalties
FROM
    Step1Table
GROUP BY
    Title_ID, Author_ID;

-- Step 3: Calculate the total profits of each author
CREATE TEMPORARY TABLE Step3Table AS
SELECT
    Author_ID,
    SUM(Advance) + SUM(Aggregated_Royalties) AS Total_Profits
FROM
    Step2Table
GROUP BY
    Author_ID
ORDER BY
    Total_Profits DESC
LIMIT 3;

-- Alternative solution & dropping temp tables
SELECT * FROM Step3Table;

DROP TEMPORARY TABLE IF EXISTS Step1Table;
DROP TEMPORARY TABLE IF EXISTS Step2Table;
DROP TEMPORARY TABLE IF EXISTS Step3Table;

-- Challenge 3 - Create a Permanent Table

-- Creating the most_profiting_authors table
CREATE TABLE most_profiting_authors (
    au_id VARCHAR(20) PRIMARY KEY,
    profits DECIMAL(10, 2)
);

-- Inserting data into the most_profiting_authors table
INSERT INTO most_profiting_authors (au_id, profits)
SELECT
    Author_ID AS au_id,
    SUM(Advance) + SUM(Aggregated_Royalties) AS profits
FROM (
    -- Subquery from Step 2
    SELECT
        Title_ID,
        Author_ID,
        SUM(Sales_Royalty) AS Aggregated_Royalties,
        MAX(Advance) AS Advance
    FROM (
        -- Subquery from Step 1
        SELECT
            t.title_id AS Title_ID,
            ta.au_id AS Author_ID,
            (t.advance * ta.royaltyper / 100) AS Advance,
            (s.qty * t.price * t.royalty / 100 * ta.royaltyper / 100) AS Sales_Royalty
        FROM
            titleauthor ta
        JOIN
            titles t ON ta.title_id = t.title_id
        JOIN
            sales s ON t.title_id = s.title_id
    ) AS Subquery_Step1
    GROUP BY
        Title_ID, Author_ID
) AS Subquery_Step2
GROUP BY
    Author_ID;

-- Verifying the data in the most_profiting_authors table
SELECT * FROM most_profiting_authors;

