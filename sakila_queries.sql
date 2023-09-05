SELECT c.customer_id, c.first_name, c.last_name
FROM customer AS c
JOIN address AS a ON c.address_id = a.address_id
JOIN city AS ci ON a.city_id = ci.city_id
JOIN country AS co ON ci.country_id = co.country_id
WHERE co.country = 'United States' AND ci.city = 'Houston';

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 175
);
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 175
);
SELECT CONCAT(c.first_name, ' ', c.last_name) AS full_name
FROM customer AS c
JOIN address AS a ON c.address_id = a.address_id
JOIN city AS ci ON a.city_id = ci.city_id
JOIN country AS co ON ci.country_id = co.country_id
WHERE co.country = 'Nepal';

SELECT staff_id, COUNT(*) AS transaction_count
FROM payment
GROUP BY staff_id
ORDER BY transaction_count DESC
LIMIT 1;

SELECT film_id, title
FROM film
WHERE film_id = (
    SELECT film_id
    FROM film_actor
    GROUP BY film_id
    ORDER BY COUNT(actor_id) DESC
    LIMIT 1
);

SELECT CONCAT(c.first_name, ' ', c.last_name) AS full_name, p.amount
FROM customer AS c
JOIN payment AS p ON c.customer_id = p.customer_id
WHERE p.amount > 6.99
AND c.customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING COUNT(*) = 1
);

SELECT category_id, COUNT(*) AS category_count
FROM film_category
GROUP BY category_id
ORDER BY category_count DESC
LIMIT 1;

