-- Update en la tabla de Sales Persons
UPDATE SalesPersons SET Store = 'Miami' WHERE ID = 4;

-- Update en la tabla de Customers
UPDATE Customers SET Email = 'ppicaso@gmail.com' WHERE Name = 'Pablo Picasso';
UPDATE Customers SET Email = 'lincoln@us.gob' WHERE Name = 'Abraham Lincoln';
UPDATE Customers SET Email = 'hello@napoleon.me' WHERE Name = 'Napoléon Bonaparte';

-- Delete en la tabla de Cars
DELETE FROM Cars WHERE ID = 4;