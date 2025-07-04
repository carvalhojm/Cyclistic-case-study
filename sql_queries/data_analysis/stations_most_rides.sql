-- top 10 start stations filtering by member type
SELECT
    start_station_name,
    COUNT(*) AS total_start

FROM `linear-skill-459817-k0.projeto_cyclistic.rides_05_2025`

WHERE member_casual = 'casual'
      AND start_station_name IS NOT NULL
      AND TIMESTAMP_DIFF(ended_at, started_at, MINUTE) > 0
      AND TIMESTAMP_DIFF(ended_at, started_at, MINUTE) < 1500  
      AND rideable_type <> "electric_scooter"

GROUP BY start_station_name

ORDER BY total_start DESC

LIMIT 10
