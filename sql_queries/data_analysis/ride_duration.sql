-- temporary table with the ride duration and filters to only count valid rides
WITH duration_rides AS (
  SELECT
    member_casual,
    TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS duration
  
  FROM `linear-skill-459817-k0.projeto_cyclistic.rides_05_2025`
  
  WHERE TIMESTAMP_DIFF(ended_at, started_at, MINUTE) > 0
  AND TIMESTAMP_DIFF(ended_at, started_at, MINUTE) < 1500  
  AND rideable_type <> "electric_scooter"
)

-- total and percentage of rides shorter and longer than 40 minutes per member type
SELECT
    member_casual,
    COUNTIF(duration < 40) AS less_40_min,
    ROUND(
        COUNTIF(duration < 40) * 100.0 / COUNT(*),
        2
    ) AS percent_less_40,
    COUNTIF(duration >= 40) AS longer_40_min,
    ROUND(
        COUNTIF(duration >= 40) * 100.0 / COUNT(*),
        2
    ) AS percent_longer_40

FROM duration_rides

GROUP BY member_casual
