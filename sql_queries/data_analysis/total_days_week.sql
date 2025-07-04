SELECT
-- extracting day of week from start date time
    EXTRACT(DAYOFWEEK FROM started_at) AS day_number,
-- converting day of week to word from start date time
    FORMAT_TIMESTAMP('%A', started_at) AS day_name,
    COUNTIF(member_casual = 'casual') AS total_casual_rides,
    COUNTIF(member_casual = 'member') AS total_member_rides

FROM `linear-skill-459817-k0.projeto_cyclistic.rides_05_2025`

WHERE TIMESTAMP_DIFF(ended_at, started_at, MINUTE) > 0
    AND TIMESTAMP_DIFF(ended_at, started_at, MINUTE) < 1500  
    AND rideable_type <> "electric_scooter"

GROUP BY day_name, day_number

ORDER BY day_number