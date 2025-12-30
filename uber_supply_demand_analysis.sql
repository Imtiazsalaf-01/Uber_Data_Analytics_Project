USE uber_analysis;
SHOW TABLES;
SHOW TABLES;
SELECT COUNT(*) FROM uber_requests;
DESCRIBE uber_requests;
SELECT * FROM uber_requests LIMIT 10;
SELECT 
    Status,
    COUNT(*) AS total_requests
FROM uber_requests
GROUP BY Status;
SELECT 
    `Pickup point`,
    Status,
    COUNT(*) AS total_requests
FROM uber_requests
GROUP BY `Pickup point`, Status
ORDER BY `Pickup point`, Status;
SELECT 
    HOUR(`Request timestamp`) AS request_hour,
    COUNT(*) AS total_requests
FROM uber_requests
GROUP BY request_hour
ORDER BY request_hour;
SELECT 
    HOUR(
        STR_TO_DATE(`Request timestamp`, '%d-%m-%Y %H.%i')
    ) AS request_hour,
    COUNT(*) AS total_requests
FROM uber_requests
GROUP BY request_hour
ORDER BY request_hour;
SELECT
    CASE
        WHEN HOUR(STR_TO_DATE(`Request timestamp`, '%d-%m-%Y %H.%i')) BETWEEN 4 AND 7 THEN 'Early Morning'
        WHEN HOUR(STR_TO_DATE(`Request timestamp`, '%d-%m-%Y %H.%i')) BETWEEN 8 AND 11 THEN 'Morning'
        WHEN HOUR(STR_TO_DATE(`Request timestamp`, '%d-%m-%Y %H.%i')) BETWEEN 12 AND 16 THEN 'Afternoon'
        WHEN HOUR(STR_TO_DATE(`Request timestamp`, '%d-%m-%Y %H.%i')) BETWEEN 17 AND 20 THEN 'Evening'
        ELSE 'Night'
    END AS time_slot,
    COUNT(*) AS total_requests
FROM uber_requests
GROUP BY time_slot
ORDER BY total_requests DESC;
SELECT
    `Pickup point`,
    Status,
    COUNT(*) AS total_requests
FROM uber_requests
GROUP BY `Pickup point`, Status
ORDER BY `Pickup point`, Status;
