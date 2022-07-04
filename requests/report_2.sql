SELECT p.*,
(SELECT COUNT(*) as c 
FROM transport t
WHERE d.id_car = t.id)
FROM drivers d, personal p
WHERE p.id = d.id_profile
ORDER BY c DESC;
