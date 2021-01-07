SELECT city, COUNT(reservations.*) AS total_reservations
FROM properties
JOIN reservations ON properties.id = reservations.property_id
GROUP by city
ORDER BY total_reservations DESC;