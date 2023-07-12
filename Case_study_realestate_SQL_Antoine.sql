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

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/regression_data.csv'
IGNORE INTO TABLE house_price_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


select *
from house_price_data;
