USE sakila;

-- Nb de films dans lesquels a joué l'acteur "Johnny LOLLOBRIGIDA"
SELECT COUNT(title) as nb_films, Cat.name
FROM actor A
INNER JOIN film_actor FA ON A.actor_id = FA.actor_id 
INNER JOIN film F ON F.film_id = FA.film_id
INNER JOIN film_category FC ON F.film_id = FC.film_id
INNER JOIN category Cat ON FC.category_id = Cat.category_id
WHERE A.first_name = "Johnny" AND A.last_name = "Lollobrigida"
GROUP BY Cat.name;

-- Les catégories dans lesquelles "Johnny LOLLOBRIGIDA" totalise plus de 3 films
SELECT COUNT(title) as nb_films, Cat.name
FROM actor A
INNER JOIN film_actor FA ON A.actor_id = FA.actor_id 
INNER JOIN film F ON F.film_id = FA.film_id
INNER JOIN film_category FC ON F.film_id = FC.film_id
INNER JOIN category Cat ON FC.category_id = Cat.category_id
WHERE A.first_name = "Johnny" AND A.last_name = "Lollobrigida"
GROUP BY Cat.name
HAVING nb_films>3;

-- Durée moyenne d'emprunt des films par acteurs
SELECT AVG(ABS(DATEDIFF( return_date , rental_date))) as avg_time, CONCAT(A.first_name, ' ', A.last_name) actor_name
FROM rental R
INNER JOIN inventory I ON R.inventory_id = I.inventory_id 
INNER JOIN film_actor FA ON I.film_id = FA.film_id
INNER JOIN actor A ON FA.actor_id = A.actor_id
GROUP BY actor_name;

-- Argent total dépensé au vidéo club par chaque client, classé par ordre décroissant
SELECT SUM(P.amount) tot_spent, CONCAT(C.first_name, ' ', C.last_name) customer
FROM payment P
INNER JOIN customer C ON P.customer_id = C.customer_id
GROUP BY customer
ORDER BY tot_spent DESC;
