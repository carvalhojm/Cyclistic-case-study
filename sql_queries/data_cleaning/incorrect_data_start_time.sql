SELECT
   COUNT(*) AS qnt_invalid_rides

FROM `linear-skill-459817-k0.projeto_cyclistic.rides_11_2024`

WHERE started_at >= ended_at