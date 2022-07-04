SELECT pers.id, pers.last_name, pers.first_name, pers.patronymic
FROM personal pers, drivers 
WHERE drivers.id_profile = pers.id AND drivers.id_insurance = 5