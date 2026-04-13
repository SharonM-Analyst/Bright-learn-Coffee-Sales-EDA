-- Databricks notebook source

--------------------------------------------------------------------------------------------------------------------------------
        -- 1. Data Cleaning
--------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- 1.1 Retrieve the data
------------------------------------------------------------------------------
SELECT * FROM `workspace`.`default`.`case_study`;



-------------------------------------------------------------------------------
-- 1.2 Check for null
-------------------------------------------------------------------------------
SELECT *
FROM `workspace`.`default`.`case_study`
WHERE 
    transaction_id IS NULL OR
    transaction_date IS NULL OR
    transaction_time IS NULL OR
    store_id IS NULL OR
    transaction_qty IS NULL OR
    store_location IS NULL OR
    product_id IS NULL OR
    product_category IS NULL OR
    product_type IS NULL OR
    product_detail IS NULL OR
    unit_price IS NULL;
-- NO NULLS


----------------------------------------------------------------------------
-- 1.3 Check For Anormalies
----------------------------------------------------------------------------
SELECT 
DISTINCT product_category, 
         product_type,
         product_detail,
SUM(transaction_qty * unit_price) AS total_revenue
FROM `workspace`.`default`.`case_study`;

--NO ANORMALIES

----------------------------------------------------------------------------
-- 1.4 Check For Duplicates
----------------------------------------------------------------------------
SELECT
    transaction_date,
    transaction_time,
    transaction_id,
    product_id,
    store_id,
    transaction_qty,
    store_location,
    product_category,
    product_type,
    product_detail,
    unit_price,
    COUNT(*) AS duplicate_count
FROM `workspace`.`default`.`case_study`
GROUP BY ALL
HAVING COUNT(*) > 1;
----NO DUPLICATES



--------------------------------------------------------------------------------------------------------------------------------
        -- 2. UNDERSTANDING DATA BY AGGREGATION
--------------------------------------------------------------------------------------------------------------------------------



--------------------------------------------------------------------------------
-- 2.1. Checking the Date Range
--------------------------------------------------------------------------------
-- They started collecting the data 2023-01-01
SELECT MIN(transaction_date) AS min_date 
FROM `workspace`.`default`.`case_study`;
-- The duration of the data is 6 months( JAN TO JUN)
-- They last collected the data 2023-06-30

SELECT MAX(transaction_date) AS latest_date 
FROM `workspace`.`default`.`case_study`;


--------------------------------------------------------------------------------
-- 2.2. Checking the names of the different stores
--------------------------------------------------------------------------------

SELECT DISTINCT store_location
FROM `workspace`.`default`.`case_study`;

SELECT COUNT(DISTINCT store_id) AS number_of_stores
FROM `workspace`.`default`.`case_study`;
-- we have 3 stores and their names are Lower Manhattan, Hell's Kitchen, Astoria


---------------------------------------------------------------------------------
-- 2.3. Checking products sold at our stores 
---------------------------------------------------------------------------------
SELECT DISTINCT product_category
FROM `workspace`.`default`.`case_study`;
--- There are 9 categories of products sold at our stores

SELECT DISTINCT product_detail
FROM `workspace`.`default`.`case_study`;
-- There are 80 products details for 9 categories of products sold at our stores

SELECT DISTINCT product_type
FROM `workspace`.`default`.`case_study`;
--- There are 29 different products type for 9 categories of products sold at our stores


SELECT DISTINCT product_category AS category,
                product_detail AS product_name
FROM `workspace`.`default`.`case_study`;
--comparing product details with their categories
--we can see that there are some products that are not in the same category but have the same name
--we can also see that there are some products that are in the same category but have different


----------------------------------------------------------------------------------
--2.4. Checking product prices
----------------------------------------------------------------------------------

SELECT MIN(unit_price) AS cheapest_price
FROM `workspace`.`default`.`case_study`;
-- cheapest product costs R0.8 cents


SELECT MAX(unit_price) AS cheapest_price
FROM `workspace`.`default`.`case_study`;
-- expensive product cost R45
---------------------------------------------------------------------------------
-- 2.5 Checking the number of Rows, sales,stores
---------------------------------------------------------------------------------
SELECT 
      COUNT(*) AS Total_values,
      COUNT(DISTINCT transaction_id) AS count_of_sales
FROM `workspace`.`default`.`case_study`;
-- we have 149116 rows of data, 149116 transactions in  period of 6 months



----------------------------------------------------------------------------------------------------------------------------------------
        --3. FEATURE ENGINEERING
----------------------------------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-- 3.1.Time Features
--------------------------------------------------------------------------------

SELECT *
FROM `workspace`.`default`.`case_study`
LIMIT 10;
--Preview the dataset (first 10 rows)


SELECT transaction_id,
      transaction_date,
      Dayname(transaction_date) AS Day_name,
      Monthname(transaction_date) AS Month_name,
      transaction_qty*unit_price AS revenue_per_tnx
FROM `workspace`.`default`.`case_study`;
-- Extract key transaction details and create new Time features


---------------------------------------------------------------------------------
-- 3.2.Average Value Spending:Data Enrichment
---------------------------------------------------------------------------------

SELECT
   
    SUM(transaction_qty * unit_price)/ NULLIF(COUNT(DISTINCT transaction_id), 0) AS avg_order_value
FROM `workspace`.`default`.`case_study`;


-------------------------------------------------------------------------------------------------------------------------------
      --Exploratory Data Analysis & Data Processing
-------------------------------------------------------------------------------------------------------------------------------



SELECT
    
    transaction_time,
    -- Extract the full transaction date
    transaction_date AS purchase_date,

    -- Get the day name Feature
    date_format(transaction_date, 'EEEE') AS day_name,

    -- Get the month name Feature
    date_format(transaction_date, 'MMMM') AS month_name,

    -- Quartely Fature
    CASE
        WHEN MONTH(transaction_date) BETWEEN 1 AND 3 THEN 'Q1'
        WHEN MONTH(transaction_date) BETWEEN 4 AND 6 THEN 'Q2'
        ELSE 'Other'
    END AS quarter_group,

    --  Weather Season Clasification Feature
    CASE
        WHEN MONTH(transaction_date) BETWEEN 1 AND 2 THEN 'Summer'
        WHEN MONTH(transaction_date) BETWEEN 3 AND 4 THEN 'Autumn'
        ELSE 'Winter'
    END AS season_pattern,

    -- Extract day number from the date (1–31) data enrichment
    day(transaction_date) AS day_of_month,


    -- Classify month end, mid-month and beginning of month, data enrichment
    CASE
        WHEN day(transaction_date) BETWEEN 1 AND 10 THEN 'Beginning of Month'
        WHEN day(transaction_date) BETWEEN 11 AND 20 THEN 'Mid of Month'
        ELSE 'End of Month'
    END AS month_pattern,


    -- Classify whether the day is a weekend or weekday
    CASE
        WHEN date_format(transaction_date, 'EEEE') IN ('Sunday', 'Saturday') THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_category,

    -- Create time buckets based on transaction time
    CASE
        WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '00:00:00' AND '11:59:59' THEN 'Morning'
        WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
        WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '17:00:00' AND '20:59:59' THEN 'Evening'
        ELSE 'Night'
    END AS time_buckets,

    -- Count unique transactions (sales)
    COUNT(DISTINCT transaction_id) AS number_of_sales,

    -- Count unique products sold
    COUNT(DISTINCT product_id) AS number_of_products,

    -- Count unique stores involved
    COUNT(DISTINCT store_id) AS number_of_stores,

    -- Calculate total revenue (quantity × price)
    SUM(transaction_qty * unit_price) AS revenue_per_day,

    -- spening Category
    CASE
        WHEN revenue_per_day <= 50 THEN 'Low Spend'
        WHEN revenue_per_day BETWEEN 51 AND 100 THEN 'Med Spend'
        ELSE 'High Spend'
        END AS Spending_category,

    -- Average Order Value (AOV)
    SUM(transaction_qty * unit_price)/ NULLIF(COUNT(DISTINCT transaction_id), 0) AS avg_order_value,

    -- Additional dimensions for grouping
    store_location,
    product_category,
    product_detail,
    product_type

FROM `workspace`.`default`.`case_study`

-- Grouping ensures aggregation works correctly
GROUP BY
    transaction_date,
    date_format(transaction_date, 'EEEE'),
    date_format(transaction_date, 'MMMM'),
    day(transaction_date),

    CASE
        WHEN MONTH(transaction_date) BETWEEN 1 AND 3 THEN 'Q1'
        WHEN MONTH(transaction_date) BETWEEN 4 AND 6 THEN 'Q2'
        ELSE 'Other'
    END,

    CASE
        WHEN MONTH(transaction_date) BETWEEN 1 AND 2 THEN 'Summer'
        WHEN MONTH(transaction_date) BETWEEN 3 AND 5 THEN 'Autumn'
        ELSE 'Winter'
    END,

    CASE
        WHEN day(transaction_date) BETWEEN 1 AND 10 THEN 'Beginning of Month'
        WHEN day(transaction_date) BETWEEN 11 AND 20 THEN 'Mid of Month'
        ELSE 'End of Month'
    END,


    CASE
        WHEN date_format(transaction_date, 'EEEE') IN ('Sunday', 'Saturday') THEN 'Weekend'
        ELSE 'Weekday'
    END,

    CASE
        WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '00:00:00' AND '11:59:59' THEN 'Morning'
        WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
        WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '17:00:00' AND '21:59:59' THEN 'Evening'
        ELSE 'Night'
    END,

    store_location,
    product_category,
    product_detail,
    product_type,
    transaction_time;










