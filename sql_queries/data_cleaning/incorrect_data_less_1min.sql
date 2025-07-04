SELECT member_casual,
      	COUNT(*) AS duration_minutes

FROM `linear-skill-459817-k0.projeto_cyclistic.rides_05_2025`

WHERE TIMESTAMP_DIFF(ended_at, started_at, MINUTE) = 0

GROUP BY member_casual