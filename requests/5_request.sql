SELECT g.*, SUM(p.sum)
FROM gibdd g, penalty p, offenses o
WHERE o.id_department = g.id AND o.id = p.id_offenses
GROUP BY g.id
ORDER BY SUM(p.sum);