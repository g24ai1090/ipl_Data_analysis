SELECT 
  dp.player_name AS batter,
  SUM(fd.batsman_runs) AS total_runs
FROM `ipl_data.fact_deliveries` AS fd
JOIN `ipl_data.dim_player` AS dp ON fd.batter_id = dp.player_id
GROUP BY batter
ORDER BY total_runs DESC
LIMIT 10;
