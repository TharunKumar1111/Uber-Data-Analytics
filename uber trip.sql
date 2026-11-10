
CREATE DATABASE uber_analytics;

USE uber_analytics;
CREATE TABLE uber_trips (
    trip_id BIGINT PRIMARY KEY,
    pickup_time DATETIME,
    dropoff_time DATETIME,
    passenger_count INT,
    trip_distance DECIMAL(10,2),
    pickup_location_id INT,
    dropoff_location_id INT,
    fare_amount DECIMAL(10,2),
    surge_fee DECIMAL(10,2),
    vehicle VARCHAR(50),
    payment_type VARCHAR(50),
    trip_duration DECIMAL(10,2),
    pickup_location VARCHAR(100),
    pickup_city VARCHAR(100),
    dropoff_location VARCHAR(100),
    dropoff_city VARCHAR(100)
);

USE uber_analysis;

SELECT COUNT(*) AS existing_records
FROM uber_trips;

SELECT *
FROM uber_trips
WHERE trip_id = 7;

TRUNCATE TABLE uber_trips;
SELECT COUNT(*) AS total_records
FROM uber_trips;


SHOW GLOBAL VARIABLES LIKE 'local_infile';


LOAD DATA LOCAL INFILE 'C:/Users/tharu/Downloads/Uber_Trip_Joined_Data.csv'
INTO TABLE uber_trips
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    trip_id,
    pickup_time,
    dropoff_time,
    passenger_count,
    trip_distance,
    pickup_location_id,
    dropoff_location_id,
    fare_amount,
    surge_fee,
    vehicle,
    payment_type,
    trip_duration,
    pickup_location,
    pickup_city,
    dropoff_location,
    dropoff_city
);



SET GLOBAL local_infile = 1;





#Day of week with highest demand
SELECT DAYNAME(pickup_time),COUNT(*) AS total_trips FROM uber_trips GROUP BY dayofweek(pickup_time),DAYNAME(pickup_time) ORDER BY total_trips DESC;

#Which hour has highest demand
SELECT HOUR(pickup_time) AS pickup_hour,COUNT(*) as total_trips FROM uber_trips GROUP BY pickup_hour ORDER BY total_trips DESC;

#which day of week generates highest revenue
SELECT DAYNAME(pickup_time) AS day_name,ROUND(SUM(fare_amount),2) AS total_revenue FROM uber_trips GROUP BY day_name order by total_revenue DESC;

#Top 10 most popular pickup locations
SELECT pickup_location,COUNT(*) AS total_pickups FROM uber_trips GROUP BY pickup_location ORDER BY total_pickups DESC LIMIT 10;

#Top 10 most popular dropoff locations
SELECT dropoff_location,COUNT(*) AS total_dropoffs FROM uber_trips GROUP BY dropoff_location ORDER BY total_dropoffs DESC LIMIT 10;

#Which pickup-to-drop-off routes are most frequently travelled
SELECT pickup_location,dropoff_location, COUNT(*) AS total_trips FROM uber_trips GROUP BY pickup_location,dropoff_location ORDER BY total_trips DESC LIMIT 10;

#Locations with highest revenue
SELECT pickup_location,ROUND(SUM(fare_amount),2) AS total_revenue FROM uber_trips GROUP BY pickup_location ORDER BY total_revenue DESC LIMIT 10;

#vehicle with highest trips
SELECT vehicle,COUNT(*) AS total_trips FROM uber_trips GROUP BY vehicle ORDER BY total_trips DESC;

#VEHICLE with highest revenue
SELECT vehicle,ROUND(SUM(fare_amount),2) AS total_revenue FROM uber_trips GROUP BY vehicle ORDER BY total_revenue DESC;

#vehicle with high avg fare
SELECT vehicle,ROUND(AVG(fare_amount),2) AS avg_fare FROM uber_trips GROUP BY vehicle ORDER BY avg_fare DESC;

#vehicle with longest avg trip duration
SELECT vehicle,ROUND(AVG(trip_duration),2) AS avg_trip_duration FROM uber_trips GROUP BY vehicle ORDER BY avg_trip_duration DESC;

#highest used payment method
SELECT payment_type,COUNT(*) AS total_transactions FROM uber_trips GROUP BY payment_type ORDER BY total_transactions DESC;

# hour with high avg_surge_fee
SELECT HOUR(pickup_time) AS pickup_hour,ROUND(AVG(surge_fee),2) AS avg_surge_fee FROM uber_trips GROUP BY pickup_hour ORDER BY avg_surge_fee DESC;

#How does trip distance affect fare amount
SELECT
    CASE
        WHEN trip_distance < 2 THEN 'Short'
        WHEN trip_distance < 5 THEN 'Medium'
        WHEN trip_distance < 10 THEN 'Long'
        ELSE 'Very Long'
    END AS distance_category,
    COUNT(*) AS total_trips,
    ROUND(AVG(fare_amount), 2) AS average_fare
FROM uber_trips
GROUP BY distance_category
ORDER BY AVG(trip_distance);

#Which pickup locations experience the highest demand during peak hours
SELECT pickup_location,HOUR(pickup_time) AS pickup_hour,COUNT(*) AS total_trips FROM uber_trips GROUP BY pickup_location, HOUR(pickup_time) ORDER BY total_trips DESC LIMIT 10;

#payment method with highest revenue
SELECT payment_type,ROUND(SUM(fare_amount), 2) AS total_revenue FROM uber_trips GROUP BY payment_type ORDER BY total_revenue DESC;
