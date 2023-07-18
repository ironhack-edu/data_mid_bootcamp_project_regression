CREATE DATABASE house_price_regression;

USE house_price_regression;

CREATE TABLE house_price_data (
    id INT,
    date DATETIME,
    bedrooms INT,
    bathrooms FLOAT,
    sqft_living INT,
    sqft_lot INT,
    floors FLOAT,
    waterfront INT,
    view INT,
    `condition` INT,
    grade INT,
    sqft_above INT,
    sqft_basement INT,
    yr_built INT,
    yr_renovated INT,
    zipcode INT,
    lat FLOAT,
    `long` FLOAT,
    sqft_living15 INT,
    sqft_lot15 INT,
    price BIGINT,
    PRIMARY KEY(id)
);

SHOW VARIABLES LIKE 'local_infile'; -- This query would show you the status of the variable ‘local_infile’. If it is off, use the next command, otherwise you should be good to go
SHOW VARIABLES LIKE 'secure_file_priv';

ALTER TABLE house_price_data MODIFY id BIGINT;
ALTER TABLE house_price_data MODIFY date VARCHAR(10);

#Loading of the database from csv to sql
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/regression_data.csv'
IGNORE INTO TABLE house_price_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

#Check all the data of the database
select *
from house_price_data;

#Remove column date
ALTER TABLE house_price_data
DROP COLUMN date;

#Count number of values
SELECT count(*)
FROM house_price_data;

#Unique values in the column bedrooms
SELECT
DISTINCT(bedrooms)
FROM house_price_data
ORDER BY bedrooms;

#unique values in the column bathrooms
SELECT
DISTINCT(bathrooms)
FROM house_price_data
ORDER BY bathrooms;

#Unique values in the column floors
SELECT
DISTINCT(floors)
FROM house_price_data
ORDER BY floors;

#Unique values in the column condition
SELECT
DISTINCT(`condition`)
FROM house_price_data
ORDER BY `condition`;

#Unique values in the column grade
SELECT
DISTINCT(grade)
FROM house_price_data
ORDER BY grade;


#IDs of the top 10 most expensive houses in your data.
SELECT
id
FROM house_price_data
ORDER BY price desc
LIMIT 10;

#What is the average price of all the properties in your data?
SELECT 
avg(price) AS avg_price
FROM house_price_data;

#Average price of the houses grouped by bedrooms
SELECT
bedrooms,
round(avg(price)) as avg_price
FROM house_price_data
GROUP BY bedrooms
ORDER BY bedrooms;

#What is the average sqft_living of the houses grouped by bedrooms? 

SELECT
bedrooms,
round(avg(sqft_living)) as avg_living_space
FROM house_price_data
GROUP BY bedrooms
ORDER BY bedrooms;

#Average price of the houses with a waterfront and without a waterfront
SELECT 
    (SELECT round(avg(price)) FROM house_price_data WHERE waterfront = 1) AS 'Price_waterfront',
    (SELECT round(avg(price)) FROM house_price_data WHERE waterfront = 0) AS 'Price_Wtht_waterfront',
    ((SELECT round(avg(price)) FROM house_price_data WHERE waterfront = 1) - 
     (SELECT round(avg(price)) FROM house_price_data WHERE waterfront = 0)) AS 'difference';


#Correlation between the columns condition and grade

SELECT
grade,
round(avg(`condition`), 2) AS 'Avg_condition'
FROM house_price_data
GROUP BY grade
ORDER BY grade;
#As we can see there is no correlation between the two variables. We can just say that the lowest grade (3) has the highest average condition

#List of properties that have 3 or 4 bedrooms, more than 3 Bathrooms, One Floor, No waterfront, 3 min for conditions, at least 5 for Grade and less than 300000 euros

SELECT *
FROM house_price_data 
WHERE bedrooms IN (3, 4) 
AND bathrooms > 3 
AND floors = 1 
AND waterfront = 0 
AND `condition` >= 3 
AND grade >= 5 
AND price < 300000;

#List of properties whose prices are twice more than the average of all the properties in the database. 
SELECT *
FROM house_price_data
WHERE price >= 2*(SELECT avg(price) FROM house_price_data);


#Creation of a view of the query
CREATE VIEW twice_average_price_view AS
SELECT *
FROM house_price_data
WHERE price >= 2*(SELECT avg(price) FROM house_price_data);


#Most customers are interested in properties with three or four bedrooms. What is the difference in average prices of the properties with three and four bedrooms?

SELECT 
    (SELECT avg(price) FROM house_price_data WHERE bedrooms IN (3, 4)) AS "avg price 3/4 bedroom",
    (SELECT avg(price) FROM house_price_data) AS "avg price overall",
    ((SELECT avg(price) FROM house_price_data WHERE bedrooms IN (3, 4)) - 
     (SELECT avg(price) FROM house_price_data)) AS "difference";


#List of the distinct zip codes

SELECT
distinct(zipcode)
FROM house_price_data;

#List of all the properties that were renovated.
SELECT *
FROM house_price_data
WHERE yr_renovated > 0;


#Provide the details of the property that is the 11th most expensive property in your database.

SELECT *
FROM house_price_data
ORDER BY price desc
LIMIT 11;

