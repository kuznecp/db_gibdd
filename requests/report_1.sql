SELECT i.*,
(SELECT COUNT(*) as c 
FROM witnesses w
WHERE i.id = w.id_case)
FROM information i
ORDER BY c DESC;


