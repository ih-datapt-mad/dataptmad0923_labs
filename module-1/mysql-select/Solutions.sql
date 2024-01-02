--- Ver toda la tabla para saber quién ha publicado qué y dónde (Challenge 01)

SELECT * 
FROM Publicaciones;

--- Hay un Error: Agodata Infosystems
UPDATE Publicaciones SET Publisher = 'Algodata Infosystems' WHERE Publisher = 'Agodata Infosystems';


--- Challenge 02: Quién ha publicado cuánto y en dónde 

SELECT "Last Name", "First Name", Publisher, COUNT(Title) AS "Total de publicaciones"
FROM Publicaciones
GROUP BY "Last Name", Publisher;

--- Challenge 3 - 3 Best Selling Authors

SELECT "Author ID", "Last Name", "First Name", COUNT(Title) AS "Publicaciones"
FROM Publicaciones
GROUP BY "Last Name"
ORDER BY "Publicaciones" DESC 
LIMIT 3;

--- Challenge 4 - 23 Best Selling Authors Ranking
SELECT "Author ID", "Last Name", "First Name", COUNT(Title) AS "Publicaciones"
FROM Publicaciones
GROUP BY "Last Name"
ORDER BY "Publicaciones" DESC;



