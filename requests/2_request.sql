SELECT pers.id, pers.address, pers.phone
FROM personal pers, drivers, transport
WHERE drivers.id_profile = pers.id and drivers.id_car = transport.id and transport.color = 'red';