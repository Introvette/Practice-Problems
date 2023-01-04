SELECT id, name, website
from trucks
WHERE vegetarian_friendly = TRUE
ORDER BY name

----------------------------------------------------------------

SELECT u.email, t.name
FROM users u
INNER JOIN trucks t ON (u.id = t.owner_id)
ORDER BY t.name

----------------------------------------------------------------

SELECT t.name, COUNT(r.*) AS num_reviews
FROM trucks AS t
-- FROM = left table
LEFT OUTER JOIN reviews AS r ON (r.truck_id = t.id)
GROUP BY t.name

----------------------------------------------------------------

SELECT t.name
, COUNT(r.*) AS num_reviews
, AVG (r.rating) AS average_rating
FROM trucks AS t
LEFT OUTER JOIN reviews AS r on (r.truck_id = t.id)
GROUP BY t.name

----------------------------------------------------------------

SELECT t.name
    , COUNT (tmi.*) AS num_items
    , ROUND ( AVG (tmi.price), 2)
FROM trucks as t
LEFT JOIN truck_menu_items AS  tmi
    ON (t.id = tmi.truck_id)
GROUP BY t.name
ORDER BY t.name DESC;

----------------------------------------------------------------

SELECT trucks.name, SUM(menu_items.calories) AS total_calories
FROM ((trucks
LEFT OUTER JOIN truck_menu_items ON trucks.id=truck_menu_items.truck_id)
LEFT OUTER JOIN menu_items ON truck_menu_items.menu_item_id=menu_items.id)
GROUP BY trucks.name
