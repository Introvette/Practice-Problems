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
LEFT OUTER JOIN reviews AS r ON (r.truck_id = t.id)
GROUP BY t.name

----------------------------------------------------------------
