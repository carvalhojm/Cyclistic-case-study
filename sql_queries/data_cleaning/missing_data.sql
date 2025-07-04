SELECT
    COUNT(*) AS total_rows,
    SUM(CASE
          WHEN start_station_name IS NULL THEN 1 ELSE 0 END) AS total_start_null,
          ROUND(100.0 * SUM(CASE WHEN start_station_name IS NULL THEN 1 ELSE 0 END) / COUNT(*), 2
    ) AS percentual_nulls
    
FROM `linear-skill-459817-k0.projeto_cyclistic.rides_05_2025`