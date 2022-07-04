SELECT man.name, man.address, inf.number_of_victims 
FROM manufacturers man, transport tr, gibdd, information inf 
WHERE inf.id_department = gibdd.id and tr.id_department = gibdd.id and 
tr.id_brand = man.id and inf.number_of_victims > 10 
ORDER BY inf.number_of_victims DESC;