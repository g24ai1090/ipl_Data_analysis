import streamlit as st
from google.cloud import bigquery
import pandas as pd
import plotly.express as px

# Title
st.set_page_config(page_title="IPL Dashboard", layout="wide")
st.title("🏏 IPL Performance Dashboard")

# Authenticate BigQuery client
client = bigquery.Client()

# Sidebar
st.sidebar.header("🔍 Filters")
season_filter = st.sidebar.selectbox("Select Season", ["All", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023"])

# Queries
def run_query(query):
    return client.query(query).to_dataframe()

# Top Batsmen
st.subheader("🏅 Top Batsmen (All Time)")
batsmen_query = """
SELECT 
  dp.player_name AS batter,
  SUM(fd.batsman_runs) AS total_runs
FROM `ipl_data.fact_deliveries` AS fd
JOIN `ipl_data.dim_player` AS dp ON fd.batter_id = dp.player_id
GROUP BY batter
ORDER BY total_runs DESC
LIMIT 10;
"""
df_batsmen = run_query(batsmen_query)
st.dataframe(df_batsmen)

# Top Bowlers
st.subheader("🎯 Top Bowlers (All Time)")
bowlers_query = """
SELECT 
  dp.player_name AS bowler,
  COUNT(*) AS wickets
FROM `ipl_data.fact_deliveries` AS fd
JOIN `ipl_data.dim_player` AS dp ON fd.bowler_id = dp.player_id
WHERE fd.is_wicket = 1
GROUP BY bowler
ORDER BY wickets DESC
LIMIT 10;
"""
df_bowlers = run_query(bowlers_query)
st.dataframe(df_bowlers)

# Team Wins
st.subheader("🏆 Most Successful Teams")
wins_query = """
SELECT 
  dm.winner AS team,
  COUNT(*) AS wins
FROM `ipl_data.dim_match` AS dm
WHERE dm.winner IS NOT NULL AND dm.winner != 'No Result'
GROUP BY team
ORDER BY wins DESC
LIMIT 10;
"""
df_wins = run_query(wins_query)
fig = px.bar(df_wins, x="team", y="wins", title="Team Win Count", text="wins", color="team")
st.plotly_chart(fig, use_container_width=True)
