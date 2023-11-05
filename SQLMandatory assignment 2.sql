
----Tasks:
----1. Create a stored procedure to display the restaurant name, type and cuisine where the table booking is not zero.
----2. Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result and rollback it.
----3. Generate a row number column and find the top 5 areas with the highest rating of restaurants.
----4. Use the while loop to display the 1 to 50. 
----5. Write a query to Create a Top rating view to store the generated top 5 highest rating of restaurants.
----6. Create a trigger that give an message whenever a new record is inserted.

----1. Create a stored procedure to display the restaurant name, type and cuisine where the table booking is not zero.

CREATE PROCEDURE GetRestaurantsWithTableBooking
AS
BEGIN
    SELECT RestaurantName, RestaurantType, CuisinesType
    FROM Jomato1
    WHERE TableBooking <> 0;
END;


----2. Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result and rollback it.
-- Begin a transaction
BEGIN TRANSACTION;

-- Update cuisine type
UPDATE Jomato1
SET CuisinesType = 'Cafeteria'
WHERE CuisinesType = 'Cafe';

-- Check the result
SELECT * FROM Jomato1; -- View the updated data

-- Rollback the transaction (to undo the update)
ROLLBACK;

----3. Generate a row number column and find the top 5 areas with the highest rating of restaurants.
WITH RankedRestaurants AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY Area ORDER BY Rating DESC) AS RowNum
    FROM Jomato1
)
SELECT *
FROM RankedRestaurants
WHERE RowNum <= 5;

----4. Use the while loop to display the 1 to 50. 

DECLARE @counter INT = 1;
WHILE @counter <= 50
BEGIN
    PRINT @counter;
    SET @counter = @counter + 1;
END;

----5. Write a query to Create a Top rating view to store the generated top 5 highest rating of restaurants.

CREATE VIEW TopRating AS
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (ORDER BY Rating DESC) AS RowNum
    FROM Jomato1
) RankedRestaurants
WHERE RowNum <= 5;

SElect * from TopRating

----6. Create a trigger that give an message whenever a new record is inserted.
CREATE TRIGGER RestaurantInsertedTrigger
ON Jomato1
AFTER INSERT
AS
BEGIN
    PRINT 'A new record has been inserted into the Jomato1 table.';
END;
