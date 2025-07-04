-- top 10 community areas filtering by member type
SELECT
  t2.COMMUNITY AS start_community,
  count(*) as qnt_rides_per_community

FROM `linear-skill-459817-k0.projeto_cyclistic.rides_05_2025` AS t1

-- join with community areas of Chicago dataset
JOIN `linear-skill-459817-k0.projeto_cyclistic.community_areas` AS t2
ON ST_CONTAINS(ST_GEOGFROMTEXT(t2.the_geom), ST_GEOGPOINT(t1.start_lng, t1.start_lat))

WHERE member_casual = 'casual'
  AND t1.start_lat IS NOT NULL
  AND t1.start_lng IS NOT NULL
  AND TIMESTAMP_DIFF(ended_at, started_at, MINUTE) > 0
  AND TIMESTAMP_DIFF(ended_at, started_at, MINUTE) < 1500  
  AND rideable_type <> "electric_scooter"

GROUP BY t2.COMMUNITY

ORDER BY qnt_rides_per_community DESC

LIMIT 10
