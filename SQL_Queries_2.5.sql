USE sakila;
-- Select all the actors with the first name ‘Scarlett’.
SELECT *
FROM actor
WHERE first_name = 'Scarlett';

-- How many physical copies of movies are available for rent in the store's inventory? How many unique movie titles are available?
SELECT count(inventory_id) AS total_copies FROM inventory; 
SELECT count(DISTINCT title) AS unique_titles FROM film;

-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MIN(length) AS min_duration,
       MAX(length) AS max_duration
FROM film;

-- What's the average movie duration expressed in format (hours, minutes)?
SELECT TIME_FORMAT(SEC_TO_TIME(AVG(length * 60)), '%H:%i') AS avg_duration
FROM film;

-- How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) AS distinct_last_names
FROM actor;

-- How many days was the company operating? Assume the last rental date was their closing date. (check DATEDIFF() function)
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS operating_days
FROM rental;

-- Show rental info with additional columns month and weekday. Get 20 results.
SELECT rental_id, rental_date, MONTH(rental_date) AS month, DAYNAME(rental_date) AS weekday 
FROM rental 
LIMIT 20;


-- Add an additional column day_type with values 'weekend' and 'work
SELECT rental_id, rental_date, DATE_FORMAT(rental_date, '%M') AS month, DATE_FORMAT(rental_date, '%W') AS weekday,
CASE WHEN DATE_FORMAT(rental_date, '%W') IN ('Saturday', 'Sunday') 
THEN 'weekend' 
ELSE 'workday' 
END AS day_type
FROM rental
LIMIT 20;

-- Get release years.
SELECT release_year
FROM film;

-- Get 10 the longest films.
SELECT title, duration
FROM film
ORDER BY duration DESC
LIMIT 10;

-- How many films include Behind the Scenes content?
SELECT COUNT(*) AS num_films
FROM film
WHERE special_features LIKE '%Behind the Scenes%';
