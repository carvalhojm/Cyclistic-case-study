SELECT
      COUNT(DISTINCT rideable_type) AS distinct_types_bike,
      COUNT(DISTINCT member_casual) AS distinct_types_subscription
      
FROM `linear-skill-459817-k0.projeto_cyclistic.rides_09_2024`
