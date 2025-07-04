SELECT
    member_casual,
    COUNT(*) AS qnt_rides_member_casual

FROM `linear-skill-459817-k0.projeto_cyclistic.rides_05_2025`

-- filters for cleaning inconsistent data
WHERE TIMESTAMP_DIFF(ended_at, started_at, MINUTE) > 0
      AND TIMESTAMP_DIFF(ended_at, started_at, MINUTE) < 1500  
      AND rideable_type <> "electric_scooter"

GROUP BY member_casual