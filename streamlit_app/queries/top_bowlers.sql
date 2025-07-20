SELECT 
  dp.player_name AS bowler,
  COUNT(*) AS wickets
FROM `ipl_data.fact_deliveries` AS fd
JOIN `ipl_data.dim_player` AS dp ON fd.bowler_id = dp.player_id
WHERE fd.is_wicket = 1
GROUP BY bowler
ORDER BY wickets DESC
LIMIT 10;
