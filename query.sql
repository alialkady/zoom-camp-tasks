--question 3
SELECT 
    SUM(CASE WHEN trip_distance <= 1 THEN 1 ELSE 0 END) AS "Up to 1 mile",
    SUM(CASE WHEN trip_distance > 1 AND trip_distance <= 3 THEN 1 ELSE 0 END) AS "In between 1 (exclusive) and 3 miles (inclusive)",
    SUM(CASE WHEN trip_distance > 3 AND trip_distance <= 7 THEN 1 ELSE 0 END) AS "In between 3 (exclusive) and 7 miles (inclusive)",
    SUM(CASE WHEN trip_distance > 7 AND trip_distance <= 10 THEN 1 ELSE 0 END) AS "In between 7 (exclusive) and 10 miles (inclusive)",
    SUM(CASE WHEN trip_distance > 10 THEN 1 ELSE 0 END) AS "Over 10 miles"
FROM green_trip_data
WHERE DATE(lpep_pickup_datetime) >= '2019-10-01' 
  AND DATE(lpep_pickup_datetime) < '2019-11-01';

-- question 4
SELECT lpep_pickup_datetime ,MAX(trip_distance) AS distance
FROM green_trip_data
Group by lpep_pickup_datetime
ORDER BY distance desc
LIMIT 1

--question 5
SELECT zones."Zone" as zone 
FROM green_trip_data
JOIN zones on zones."LocationID" = green_trip_data."PULocationID"
WHERE Date(lpep_pickup_datetime) = '2019-10-18'
GROUP BY zone
HAVING Sum(total_amount) > 13000

--question 6
SELECT zones."Zone"
FROM green_trip_data
JOIN zones on zones."LocationID" = green_trip_data."DOLocationID"
WHERE "PULocationID" = 74 AND Date(lpep_pickup_datetime) BETWEEN '2019-10-1' AND '2019-10-31'
GROUP BY zones."Zone"
order by MAX(tip_amount) desc
LIMIT 1