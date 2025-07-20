# 🏏 IPL Match Performance Analyser

An interactive data-driven dashboard to visualize and analyze 17 seasons of IPL cricket data using Python, BigQuery, and Streamlit.

---

## 🎯 Objective

To extract meaningful insights from historical IPL data related to players, teams, venues, and match outcomes, and present them via a scalable and interactive web dashboard.

---

## 🧰 Technology Stack

- **Python** & **Pandas**: Data preprocessing & ETL  
- **Google BigQuery**: Scalable backend for analytics queries  
- **Streamlit**: Web dashboard for interactive visualization  
- **GitHub**: Version control and collaboration  
- **Google Colab**: Used for ETL scripting and testing  
- **db-dtypes**: Enabled pandas-compatible BigQuery exports  

---

## 🗂️ Data Sources & ETL

- **Source**: [Kaggle IPL Dataset](https://www.kaggle.com/datasets)
- **Files Used**: `matches.csv`, `deliveries.csv`

### ✅ ETL Process

- Merged datasets on `match_id` to combine match-level and ball-level data
- Cleaned null values, standardized field formats
- Resolved naming inconsistencies (e.g., "Delhi Daredevils" vs "Delhi Capitals")
- Created engineered features:
  - Total runs
  - Wickets
  - Toss impact
  - Match outcomes
- Saved cleaned data to BigQuery for further analysis

---

## 🧽 Why Data Cleaning Is Crucial in Analytics Projects

Data cleaning is foundational to any reliable analytics project. Without it, visualizations and insights can become misleading or inaccurate.

### Common Issues in Raw Sports Data:
- Inconsistent naming (e.g., `"Delhi Daredevils"` vs `"Delhi Capitals"`)
- Missing values (e.g., `winner`, `result_margin`)
- Duplicate or outlier records

### Benefits of Cleaning:
- ✅ Ensures consistency across queries and visualizations  
- ✅ Improves interpretability and accuracy  
- ✅ Reduces bias and noise  
- ✅ Makes aggregations (like total runs/wins) reliable  

---

## 🧮 Key Stats After Cleaning

| Metric              | Value       |
|---------------------|-------------|
| Total Matches       | 1,095       |
| Total Seasons       | 20          |
| Total Venues        | 58          |
| Total Cities        | 36          |
| Total Teams         | 19          |
| Total Players       | 673         |

### 🪙 Toss Decision Breakdown
- Field First: 704 times  
- Bat First: 391 times  

### 🏁 Match Result Types
- Won by Wickets: 578 matches  
- Won by Runs: 498 matches  
- Tie: 14 matches  
- No Result: 5 matches  

---

## 📊 Dashboard Analysis Highlights

### 🏅 Top Batsmen (by Runs)

| Player        | Runs  |
|---------------|--------|
| **V Kohli**   | 8014   |
| **S Dhawan**  | 6769   |
| **DA Warner** | 6567   |
| **RG Sharma** | 6630   |
| **SK Raina**  | 5536   |

---

### 🎯 Top Bowlers (by Wickets)

| Player         | Wickets |
|----------------|----------|
| **YS Chahal**  | 213      |
| **DJ Bravo**   | 207      |
| **PP Chawla**  | 201      |
| **SP Narine**  | 200      |
| **R Ashwin**   | 198      |

---

### 🏆 Top Teams (by Wins)

| Team                        | Wins  |
|-----------------------------|--------|
| **Mumbai Indians**          | 144    |
| **Chennai Super Kings**     | 138    |
| **Kolkata Knight Riders**   | 131    |
| **Royal Challengers Bangalore** | 116    |
| **Rajasthan Royals**        | 112    |

---

## 📺 Streamlit Dashboard

- Built using **Streamlit + BigQuery Connector**
- Displays real-time data from your `ipl_data` star schema
- Includes tables, bar charts, and filters (seasons, team)

To run the dashboard locally:

```bash
pip install -r requirements.txt
streamlit run app.py
