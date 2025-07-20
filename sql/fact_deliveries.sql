CREATE OR REPLACE TABLE ipl_data.fact_deliveries AS
SELECT
  mdc.match_id,
  bp.player_id AS batter_id,
  bw.player_id AS bowler_id,
  bt.team_id AS batting_team_id,
  bl.team_id AS bowling_team_id,
  mdc.batsman_runs,
  mdc.extra_runs,
  mdc.total_runs,
  mdc.is_wicket,
  mdc.player_dismissed,
  mdc.dismissal_kind
FROM `ipl_data.matches_deliveries_combined` AS mdc
JOIN ipl_data.dim_player AS bp ON mdc.batter = bp.player_name
JOIN ipl_data.dim_player AS bw ON mdc.bowler = bw.player_name
JOIN ipl_data.dim_team AS bt ON mdc.batting_team = bt.team_name
JOIN ipl_data.dim_team AS bl ON mdc.bowling_team = bl.team_name;
