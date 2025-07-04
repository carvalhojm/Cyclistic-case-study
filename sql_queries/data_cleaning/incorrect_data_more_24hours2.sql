SELECT COUNT(*) AS qnt_rides_over_24

FROM `linear-skill-459817-k0.projeto_cyclistic.rides_03_2025`

WHERE TIMESTAMP_DIFF(ended_at, started_at, HOUR) > 24