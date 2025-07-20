CREATE OR REPLACE TABLE ipl_data.dim_player AS
SELECT DISTINCT
  ROW_NUMBER() OVER (ORDER BY player_name) AS player_id,
  player_name
FROM (
  SELECT batter AS player_name FROM `ipl_data.matches_deliveries_combined`
  UNION DISTINCT
  SELECT bowler AS player_name FROM `ipl_data.matches_deliveries_combined`
);
