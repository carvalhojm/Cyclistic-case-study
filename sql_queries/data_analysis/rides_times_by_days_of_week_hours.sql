SELECT
       EXTRACT(DAYOFWEEK FROM started_at) AS day_of_week,
       FORMAT_TIMESTAMP('%A', started_at) AS day_name,
       EXTRACT(HOUR FROM started_at) AS hour_of_day,
       COUNTIF(member_casual = 'casual') AS total_casual_rides,
       COUNTIF(member_casual = 'member') AS total_member_rides

FROM `linear-skill-459817-k0.projeto_cyclistic.rides_05_2025`

WHERE TIMESTAMP_DIFF(ended_at, started_at, MINUTE) > 0
  AND TIMESTAMP_DIFF(ended_at, started_at, MINUTE) < 1500  
  AND rideable_type <> "electric_scooter"  

GROUP BY day_of_week, day_name, hour_of_day

ORDER BY day_of_week, hour_of_day
