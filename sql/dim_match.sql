CREATE OR REPLACE TABLE ipl_data.dim_match AS
SELECT DISTINCT
  match_id,
  season,
  date,
  city,
  venue,
  toss_winner,
  toss_decision,
  winner,
  result,
  result_margin,
  super_over
FROM `ipl_data.matches_deliveries_combined`;
