SELECT 
  dt.team_name AS team,
  COUNT(DISTINCT dm.match_id) AS wins
FROM `ipl_data.dim_match` AS dm
JOIN `ipl_data.dim_team` AS dt ON dm.winner = dt.team_name
GROUP BY team
ORDER BY wins DESC
LIMIT 10;
