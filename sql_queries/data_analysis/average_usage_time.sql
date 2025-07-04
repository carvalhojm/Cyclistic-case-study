-- temporary table with the ride duration and filters to only count valid rides
WITH ride_duration_minutes as (
      SELECT
            started_at,
            ended_at,
            TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS duration_minutes,
            member_casual
      
      FROM `linear-skill-459817-k0.projeto_cyclistic.rides_03_2025`
      
      WHERE TIMESTAMP_DIFF(ended_at, started_at, MINUTE) > 0
            AND TIMESTAMP_DIFF(ended_at, started_at, MINUTE) < 1500
            AND rideable_type <> "electric_scooter"
)

-- finding total rides, duration and average per ride type
SELECT
  member_casual,
  COUNT(*) AS total_per_member,
  SUM(duration_minutes) AS total_duration_ride,
  ROUND(AVG(duration_minutes), 2) AS avg_per_member

FROM ride_duration_minutes

GROUP BY member_casual