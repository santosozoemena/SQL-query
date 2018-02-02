USE sakila;

SELECT * FROM actor;
select concat(first_name, ' ', last_name) AS Actor_name
FROM actor;

SELECT actor_id, first_name, last_name 
FROM actor
WHERE first_name = 'Joe';

SELECT * FROM actor
WHERE last_name LIKE '%Gen%';

SELECT last_name, first_name
FROM actor
WHERE last_name LIKE '%LI%';

SELECT country_id, country
FROM country
WHERE country IN ('Afghanistan', 'Bangladesh','China');

ALTER TABLE actor
ADD Middle_name VARCHAR(30);
ALTER TABLE actor MODIFY Middle_name varchar(20) AFTER first_name;

ALTER TABLE actor
MODIFY COLUMN Middle_name BLOB;

ALTER TABLE actor
DROP Middle_name;

SELECT COUNT(last_name) AS CO, last_name
FROM actor
GROUP BY last_name;

SELECT COUNT(last_name) AS CO , last_name
FROM actor
GROUP BY (last_name)
HAVING COUNT(last_name) > 1;

UPDATE actor
SET first_name = 'GROUCHO', last_name = 'WILLIAMS'
WHERE first_name = 'Harpo' and last_name = 'williams';

SELECT  first_name, last_name, address
FROM staff
JOIN address ON staff.address_id = address.address_id;



SELECT SUM(amount) as Total, first_name, last_name
FROM payment 
JOIN staff ON staff.staff_id = payment.staff_id
WHERE payment_date >= '2005-08-01 00:00:00'
GROUP BY first_name,last_name
ORDER BY SUM(amount) DESC;

SELECT * FROM film;
SELECT * FROM film_actor;

SELECT COUNT(title) as COUNTs, title
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
GROUP BY title;

SELECT COUNT(*) as Film_total
FROM inventory
WHERE film_id = 439;

SELECT * FROM payment;
SELECT * FROM customer;

SELECT SUM(amount) as Sums ,first_name, last_name
FROM customer
JOIN payment ON payment.customer_id = customer.customer_id
GROUP BY first_name, last_name
ORDER BY last_name;

SELECT * FROM film;
SELECT * FROM language;

SELECT title
FROM film,
(SELECT name FROM language
WHERE name = 'english') as j
WHERE title LIKE 'K%' OR title LIKE 'Q%';

SELECT title, k.first_name, k.last_name
FROM film,
(SELECT first_name, last_name FROM actor) as k
WHERE title = 'beauty grease';

SELECT * FROM actor;
SELECT * FROM film_actor;
SELECT * FROM film;

SELECT first_name, last_name 
FROM actor
WHERE actor_id IN 
(SELECT actor_id FROM  film_actor 
WHERE film_id = 17);

SELECT * FROM customer;
SELECT * FROM address;

SELECT * FROM city;
SELECT * FROM country;
#7
SELECT first_name, last_name, email
FROM customer
JOIN address 
ON (customer.address_id = address.address_id)
JOIN city 
ON (address.city_id = city.city_id)
JOIN country 
ON (city.country_id = country.country_id)
WHERE country  = 'Canada';




SELECT * FROM category;
SELECT * FROM film;
SELECT * FROM film_category;

SELECT title, film_id
FROM film WHERE film_id IN (SELECT film_id FROM film_category
WHERE category_id = '8');

SELECT * FROM rental;
SELECT * FROM film;
SELECT * FROM inventory;
SELECT * FROM store;
SELECT * FROM payment;

SELECT film_id,COUNT(film_id)
FROM inventory
GROUP BY film_id;




SELECT * FROM store;
SELECT * FROM staff;
SELECT * FROM address;
SELECT * FROM rental;

SELECT store.store_id, SUM(amount)
from staff
join store
ON (staff.store_id = store.store_id)
JOIN payment 
ON (payment.staff_id = staff.staff_id)
GROUP BY store_id; 

#store ID, city, and country.

SELECT store_id, city, country
FROM store
JOIN address
ON store.address_id = address.address_id
JOIN city
On (address.city_id = city.city_id) 
JOIN  country
ON city.country_id = country.country_id
;
