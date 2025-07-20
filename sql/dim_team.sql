CREATE OR REPLACE TABLE ipl_data.dim_team AS
SELECT DISTINCT
  ROW_NUMBER() OVER (ORDER BY team_name) AS team_id,
  team_name
FROM (
  SELECT batting_team AS team_name FROM `ipl_data.matches_deliveries_combined`
  UNION DISTINCT
  SELECT bowling_team AS team_name FROM `ipl_data.matches_deliveries_combined`
);