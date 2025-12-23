--- Query 1: JOIN --

SELECT
  b.id AS booking_id,
  users.name AS customer_name,
  vehicles.name AS vehicle_name,
  b.start_date,
  b.end_date,
  b.status
FROM bookings AS b
INNER JOIN users ON b.user_id = users.id
INNER JOIN vehicles ON b.vehicle_id = vehicles.id;


-- Query 2: EXISTS --

SELECT *
FROM vehicles
WHERE NOT EXISTS (
    SELECT id
    FROM bookings
    WHERE bookings.vehicle_id = vehicles.id
);


--- Query 3: WHERE --

SELECT *
FROM vehicles
WHERE type = 'car' AND status = 'available';


-- Query 4: GROUP BY and HAVING --

SELECT 
    vehicles.name AS vehicle_name,
    COUNT(bookings.id) AS total_bookings
FROM bookings
INNER JOIN vehicles
    ON bookings.vehicle_id = vehicles.id
GROUP BY vehicles.name
HAVING COUNT(bookings.id) > 2;

