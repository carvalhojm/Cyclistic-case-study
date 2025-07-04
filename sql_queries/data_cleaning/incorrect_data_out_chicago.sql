SELECT COUNT(*) AS total_out_chicago

FROM `linear-skill-459817-k0.projeto_cyclistic.rides_05_2025` AS t1

-- join with community areas of Chicago dataset
LEFT JOIN `linear-skill-459817-k0.projeto_cyclistic.community_areas` AS t2
  ON ST_CONTAINS(ST_GEOGFROMTEXT(t2.the_geom), ST_GEOGPOINT(t1.start_lng, t1.start_lat))
  
WHERE t1.start_lat IS NOT NULL
  AND t1.start_lng IS NOT NULL
  AND t2.COMMUNITY IS NULL