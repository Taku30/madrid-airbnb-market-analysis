-- ==========================================================
-- Madrid Airbnb SQL Analysis
-- Author: Taku Takahashi
-- ==========================================================

-- ==========================================================
-- SECTION 1: DATA EXPLORATION
-- ==========================================================

-- ----------------------------------------------------------
-- Query 1
-- Business Question:
-- How many Airbnb listings are there in Madrid?
-- Skills: COUNT()
-- ----------------------------------------------------------

SELECT COUNT(*) AS total_listings
FROM listings;


-- ----------------------------------------------------------
-- Query 2
-- Business Question:
-- What does the dataset look like?
-- Skills: SELECT, LIMIT
-- ----------------------------------------------------------

SELECT *
FROM listings
LIMIT 10;


-- ----------------------------------------------------------
-- Query 3
-- Business Question:
-- What room types are available, and how common is each?
-- Skills: GROUP BY, COUNT(), ORDER BY
-- ----------------------------------------------------------

SELECT room_type,
       COUNT(*) AS total_listings
FROM listings
GROUP BY room_type
ORDER BY total_listings DESC;


-- ----------------------------------------------------------
-- Query 4
-- Business Question:
-- Which neighborhoods have the most Airbnb listings?
-- Skills: GROUP BY, COUNT(), ORDER BY
-- ----------------------------------------------------------

SELECT neighbourhood,
       COUNT(*) AS total_listings
FROM listings
GROUP BY neighbourhood
ORDER BY total_listings DESC;


-- ----------------------------------------------------------
-- Query 5
-- Business Question:
-- How many unique hosts are in the dataset?
-- Skills: COUNT(DISTINCT)
-- ----------------------------------------------------------

SELECT COUNT(DISTINCT host_id) AS unique_hosts
FROM listings;

-- ==========================================================
-- SECTION 2: PRICING ANALYSIS
-- ==========================================================

-- ----------------------------------------------------------
-- Query 6
-- Business Question:
-- What is the average Airbnb price in Madrid?
-- Skills: AVG(), ROUND()
-- ----------------------------------------------------------

SELECT ROUND(AVG(price),2) AS average_price
FROM listings;


-- ----------------------------------------------------------
-- Query 7
-- Business Question:
-- Which room type has the highest average nightly price?
-- Skills: GROUP BY, AVG(), ORDER BY
-- ----------------------------------------------------------

SELECT room_type,
       ROUND(AVG(price),2) AS average_price
FROM listings
GROUP BY room_type
ORDER BY average_price DESC;


-- ----------------------------------------------------------
-- Query 8
-- Business Question:
-- Which neighborhoods have the highest average Airbnb prices?
-- Skills: GROUP BY, AVG(), ORDER BY
-- ----------------------------------------------------------

SELECT neighbourhood,
       ROUND(AVG(price),2) AS average_price
FROM listings
GROUP BY neighbourhood
ORDER BY average_price DESC
LIMIT 10;


-- ----------------------------------------------------------
-- Query 9
-- Business Question:
-- Which neighborhoods offer the lowest average Airbnb prices?
-- Skills: GROUP BY, AVG(), ORDER BY
-- ----------------------------------------------------------

SELECT neighbourhood,
       ROUND(AVG(price),2) AS average_price
FROM listings
GROUP BY neighbourhood
ORDER BY average_price ASC
LIMIT 10;


-- ----------------------------------------------------------
-- Query 10
-- Business Question:
-- What are the 10 most expensive listings?
-- Skills: ORDER BY, LIMIT
-- ----------------------------------------------------------

SELECT name,
       neighbourhood,
       room_type,
       price
FROM listings
ORDER BY price DESC NULLS LAST
LIMIT 10;

-- ==========================================================
-- SECTION 3: HOST ANALYSIS
-- ==========================================================

-- ----------------------------------------------------------
-- Query 11
-- Business Question:
-- Which hosts manage the largest number of Airbnb listings?
-- Skills: GROUP BY, COUNT(), ORDER BY
-- ----------------------------------------------------------

SELECT host_id,
       host_name,
       COUNT(*) AS total_listings
FROM listings
GROUP BY host_id, host_name
ORDER BY total_listings DESC
LIMIT 10;


-- ----------------------------------------------------------
-- Query 12
-- Business Question:
-- What is the average number of listings per host?
-- Skills: CTE, AVG()
-- ----------------------------------------------------------

WITH host_counts AS (

SELECT host_id,
       COUNT(*) AS listings
FROM listings
GROUP BY host_id

)

SELECT ROUND(AVG(listings),2)
AS average_listings_per_host
FROM host_counts;


-- ----------------------------------------------------------
-- Query 13
-- Business Question:
-- How many hosts have only one listing?
-- Skills: HAVING
-- ----------------------------------------------------------

SELECT COUNT(*)
FROM (

SELECT host_id
FROM listings
GROUP BY host_id
HAVING COUNT(*) = 1

) one_listing_hosts;


-- ----------------------------------------------------------
-- Query 14
-- Business Question:
-- Which hosts have listings in multiple neighborhoods?
-- Skills: COUNT(DISTINCT)
-- ----------------------------------------------------------

SELECT host_id,
       host_name,
       COUNT(DISTINCT neighbourhood)
AS neighbourhoods
FROM listings
GROUP BY host_id, host_name
HAVING COUNT(DISTINCT neighbourhood) > 1
ORDER BY neighbourhoods DESC;


-- ----------------------------------------------------------
-- Query 15
-- Business Question:
-- Which hosts charge the highest average price?
-- Skills: AVG(), GROUP BY
-- ----------------------------------------------------------

SELECT host_name,
       ROUND(AVG(price), 2) AS average_price
FROM listings
WHERE price IS NOT NULL
GROUP BY host_name
ORDER BY average_price DESC NULLS LAST
LIMIT 10;

-- ==========================================================
-- SECTION 4: REVIEWS & AVAILABILITY
-- ==========================================================

-- ----------------------------------------------------------
-- Query 16
-- Business Question:
-- Which listings have received the most reviews?
-- Skills: ORDER BY
-- ----------------------------------------------------------

SELECT name,
       neighbourhood,
       number_of_reviews
FROM listings
ORDER BY number_of_reviews DESC
LIMIT 10;


-- ----------------------------------------------------------
-- Query 17
-- Business Question:
-- Which room type receives the most reviews on average?
-- Skills: AVG(), GROUP BY
-- ----------------------------------------------------------

SELECT room_type,
       ROUND(AVG(number_of_reviews),2)
AS average_reviews
FROM listings
GROUP BY room_type
ORDER BY average_reviews DESC;


-- ----------------------------------------------------------
-- Query 18
-- Business Question:
-- Which neighborhoods have the highest average availability?
-- Skills: AVG(), GROUP BY
-- ----------------------------------------------------------

SELECT neighbourhood,
       ROUND(AVG(availability_365),2)
AS average_availability
FROM listings
GROUP BY neighbourhood
ORDER BY average_availability DESC;


-- ----------------------------------------------------------
-- Query 19
-- Business Question:
-- What is the average minimum stay requirement by room type?
-- Skills: AVG(), GROUP BY
-- ----------------------------------------------------------

SELECT room_type,
       ROUND(AVG(minimum_nights),2)
AS average_minimum_nights
FROM listings
GROUP BY room_type
ORDER BY average_minimum_nights DESC;


-- ----------------------------------------------------------
-- Query 20
-- Business Question:
-- Which listings have the highest review activity in the last 12 months?
-- Skills: ORDER BY
-- ----------------------------------------------------------

SELECT name,
       neighbourhood,
       number_of_reviews_ltm
FROM listings
ORDER BY number_of_reviews_ltm DESC
LIMIT 10;