SELECT tr.id, tr.id_brand, tr.type, tr.year_of_release
FROM transport tr, drivers dr, information inf
WHERE dr.id_car = tr.id and dr.id_case = inf.id and
inf.stopper = true and (inf.place_of_hit = 'Boot' or inf.place_of_hit = 'Door');