SELECT
    member_casual,
    rideable_type,
    COUNT(*) AS total_member_type_rides,
-- count of percentage of rides by bike type relative to total member ride types
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY member_casual),
        2
    ) AS percent_per_type

FROM `linear-skill-459817-k0.projeto_cyclistic.rides_05_2025`

WHERE TIMESTAMP_DIFF(ended_at, started_at, MINUTE) > 0
    AND TIMESTAMP_DIFF(ended_at, started_at, MINUTE) < 1500  
    AND rideable_type <> "electric_scooter"

GROUP BY member_casual, rideable_type

ORDER BY member_casual
