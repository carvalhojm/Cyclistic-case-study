SELECT
      COUNT(*) AS total_rides,
      COUNT(DISTINCT ride_id) AS distinct_ride_id
      
FROM `linear-skill-459817-k0.projeto_cyclistic.rides_05_2025`