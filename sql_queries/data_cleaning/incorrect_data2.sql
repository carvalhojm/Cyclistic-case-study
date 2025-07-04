SELECT rideable_type,
      COUNT(*) AS total_per_rideable_type,
      -- calculate percentage in relation to sum categories
      ROUND(100 * COUNT(*) / SUM(COUNT(*)) OVER(), 2) AS percentual_type

FROM `linear-skill-459817-k0.projeto_cyclistic.rides_09_2024`

GROUP BY rideable_type