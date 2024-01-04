-- Challenge 1 - Most Profiting Authors --

-- Step 1: Calculate the royalty of each sale for each author and the advance for each author and publication--

SELECT
    titleauthor.title_id,
    titleauthor.au_id AS author_id,
    round(titles.advance * titleauthor.royaltyper / 100,0) AS advance,
    round(titles.advance * titleauthor.royaltyper / 100 + (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100),0) AS sales_royalty
FROM
    titles
    JOIN titleauthor ON titles.title_id = titleauthor.title_id
    JOIN sales ON titles.title_id = sales.title_id;

-- Step 2: Aggregate the total royalties for each title and author --

SELECT
    title_id,
    author_id,
    ROUND(SUM(sales_royalty),0) AS aggregated_royalties
FROM
    (
        -- Step 1 Query (Subquery)
        SELECT
            titleauthor.title_id,
            titleauthor.au_id AS author_id,
            titles.advance * titleauthor.royaltyper / 100 + (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS sales_royalty
        FROM
            titles
            JOIN titleauthor ON titles.title_id = titleauthor.title_id
            JOIN sales ON titles.title_id = sales.title_id
    ) AS Step1Result
GROUP BY
    title_id, author_id;


-- Step 3: Calculate the total profits of each author --
SELECT
    author_id,
    SUM(advance) + SUM(aggregated_royalties) AS total_profits
FROM
    (
        -- Step 2 Query (Subquery)
        SELECT
            title_id,
            author_id,
            ROUND(advance, 2) AS advance,
            SUM(sales_royalty) AS aggregated_royalties
        FROM
            (
                -- Step 1 Query (Subquery)
                SELECT
                    titleauthor.title_id,
                    titleauthor.au_id AS author_id,
                    titles.advance * titleauthor.royaltyper / 100 AS advance,
                    titles.advance * titleauthor.royaltyper / 100 + (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS sales_royalty
                FROM
                    titles
                    JOIN titleauthor ON titles.title_id = titleauthor.title_id
                    JOIN sales ON titles.title_id = sales.title_id
            ) AS Step1Result
        GROUP BY
            title_id, author_id, advance
    ) AS Step2Result
GROUP BY
    author_id
ORDER BY
    total_profits DESC
LIMIT 3;

-- Challenge 2 - Alternative Solution --

-- Step 1 --

DROP TEMPORARY TABLE IF EXISTS temp_step1;
CREATE TEMPORARY TABLE temp_step1 AS
    SELECT
        titleauthor.title_id,
        titleauthor.au_id AS author_id,
        ROUND(titles.advance * titleauthor.royaltyper / 100,0) AS advance,
        ROUND(titles.advance * titleauthor.royaltyper / 100 + (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100),0) AS sales_royalty
    FROM
        titles
        JOIN titleauthor ON titles.title_id = titleauthor.title_id
        JOIN sales ON titles.title_id = sales.title_id;

-- Step 2 --

DROP TEMPORARY TABLE IF EXISTS temp_step2;
CREATE TEMPORARY TABLE temp_step2 AS
    SELECT
        title_id,
        author_id,
        SUM(sales_royalty) AS aggregated_royalties
    FROM
        temp_step1
    GROUP BY
        title_id, author_id;

-- Step 3 -- 

SELECT
    temp_step1.author_id,
    SUM(temp_step1.advance) + SUM(temp_step2.aggregated_royalties) AS total_profits
FROM
    temp_step1
    JOIN temp_step2 ON temp_step1.title_id = temp_step2.title_id AND temp_step1.author_id = temp_step2.author_id
GROUP BY
    temp_step1.author_id
ORDER BY
    total_profits DESC
LIMIT 3;

-- Challenge 3 --

DROP TABLE IF EXISTS most_profiting_authors;

CREATE TABLE most_profiting_authors (
    au_id VARCHAR(15) PRIMARY KEY,
    profits DECIMAL(10, 2)
);

INSERT INTO most_profiting_authors (au_id, profits)
SELECT
    temp_step1.author_id AS au_id,
    SUM(temp_step1.advance) + SUM(temp_step2.aggregated_royalties) AS profits
FROM
    temp_step1
    JOIN temp_step2 ON temp_step1.title_id = temp_step2.title_id AND temp_step1.author_id = temp_step2.author_id
GROUP BY
    temp_step1.author_id;

