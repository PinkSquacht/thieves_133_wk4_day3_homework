-- 1. List all customers who live in Texas (use
-- JOINs)
SELECT * FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id WHERE city = 'Texas';


-- 2. Get all payments above $6.99 with the Customer's Full
-- Name 
SELECT first_name, last_name, amount FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;

-- 3. Show all customers names who have made payments over $175(use
-- subqueries) 
SELECT first_name, last_name FROM customer
WHERE customer_id IN (SELECT customer_id FROM payment WHERE amount > 175);

-- 4. List all customers that live in Nepal (use the city
-- table)
SELECT * FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id WHERE city = 'Nepal';

-- 5. Which staff member had the most
-- transactions?
SELECT staff_id, COUNT(*) FROM payment
GROUP BY staff_id
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 6. How many movies of each rating are
-- there?
SELECT rating, COUNT(*) FROM film AS f
JOIN film_category AS fc ON f.film_id = fc.film_id
JOIN category AS c ON fc.category_id = c.category_id
GROUP BY rating;

-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)
SELECT first_name, last_name FROM customer
WHERE customer_id IN (SELECT customer_id FROM payment WHERE amount > 6.99)
GROUP BY customer_id
HAVING COUNT(*) = 1;




-- 8. how many free rentals did our stores give away?
SELECT COUNT(*) FROM payment
WHERE amount = 0;


