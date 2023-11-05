---Tasks to be done:
---1. Create a user-defined functions to stuff the Chicken into ‘Quick Bites’. Eg: ‘Quick Chicken Bites’.
---2. Use the function to display the restaurant name and cuisine type which has the maximum number of rating.
---3. Create a Rating Status column to display the rating as ‘Excellent’ if it has more the 4 start rating, ‘Good’ if it has above 3.5 and below 5 star rating, ‘Average’ if it is above 3 and below 3.5 and ‘Bad’ if it is below 3 star rating.
---4. Find the Ceil, floor and absolute values of the rating column and display the current date and separately display the year, month_name and day.
---5. Display the restaurant type and total average cost using rollup

---1. Create a user-defined functions to stuff the Chicken into ‘Quick Bites’. Eg: ‘Quick Chicken Bites’.
select * from Jomato1
CREATE FUNCTION dbo.StuffChickenIntoQuickBites1 (@RestaurantType NVARCHAR(MAX))
RETURNS NVARCHAR(MAX)
AS
BEGIN
    RETURN REPLACE(@RestaurantType, 'Quick Bites', 'Quick Chicken Bites');
END;

UPDATE Jomato1
SET RestaurantType = dbo.StuffChickenIntoQuickBites1(RestaurantTypee)
WHERE RestaurantType ='Quick Bites';



---2. Use the function to display the restaurant name and cuisine type which has the maximum number of rating.
SELECT TOP 1 WITH TIES
    RestaurantName,
    dbo.StuffChickenIntoQuickBites(CuisinesType) AS UpdatedCuisine
FROM Jomato1
ORDER BY No_of_Rating DESC;

---3. Create a Rating Status column to display the rating as ‘Excellent’ if it has more the 4 start rating, ‘Good’ if it has above 3.5 and below 5 star rating, ‘Average’ if it is above 3 and below 3.5 and ‘Bad’ if it is below 3 star rating.

SELECT
    *,
    CASE
        WHEN Rating > 4 THEN 'Excellent'
        WHEN Rating > 3.5 AND Rating <= 5 THEN 'Good'
        WHEN Rating > 3 AND Rating <= 3.5 THEN 'Average'
        ELSE 'Bad'
    END AS RatingStatus
FROM Jomato1;

---4. Find the Ceil, floor and absolute values of the rating column and display the current date and separately display the year, month_name and day.

SELECT
    RestaurantName,
    ceiling(Rating) AS CeilingRating,
    FLOOR(Rating) AS FloorRating,
    ABS(Rating) AS AbsoluteRating,
    GETDATE() AS CurrentDate,
    YEAR(GETDATE()) AS CurrentYear,
    DATENAME(MONTH, GETDATE()) AS CurrentMonthName,
    DAY(GETDATE()) AS CurrentDay
FROM Jomato1;
---5. Display the restaurant type and total average cost using rollup

SELECT
    ISNULL(RestaurantType, 'Total') AS RestaurantType,
    AVG(AverageCost) AS TotalAvgCost
FROM Jomato1
GROUP BY ROLLUP (RestaurantType);





