# 🏝️ Pulau Pari Tourism Demand Forecasting
### Time Series Analysis & SARIMA Forecasting | Google Trends Data

![Python](https://img.shields.io/badge/Python-3.x-3776AB?style=flat&logo=python&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-Data%20Wrangling-150458?style=flat&logo=pandas&logoColor=white)
![Statsmodels](https://img.shields.io/badge/Statsmodels-Time%20Series-4B8BBE?style=flat)
![Scikit-learn](https://img.shields.io/badge/Scikit--learn-Evaluation-F7931E?style=flat&logo=scikit-learn&logoColor=white)
![Matplotlib](https://img.shields.io/badge/Matplotlib-Visualization-11557c?style=flat)

---

## 📌 Project Overview

As a data analyst at a **travel agency**, I was tasked with analyzing tourist demand for **Pulau Pari**, a popular island destination in Indonesia. Using **Google Trends data** as a proxy for tourism interest, I built a forecasting model to predict popularity trends for the **next 52 weeks** — enabling the business to plan marketing campaigns, resource allocation, and pricing strategies ahead of time.

> **Business Question:** *How popular will Pulau Pari be over the next year, and when are the peak and off-peak seasons?*

---

## 🎯 Key Results

| Metric | Value |
|---|---|
| 📅 Forecast Horizon | **52 weeks ahead** |
| 📈 Peak Season Identified | **April** (consistently highest popularity, 2022–2024) |
| 📉 Off-Peak Season Identified | **December** (consistently lowest popularity) |
| 🏆 Best Model | **SARIMA** (Grid Search optimized) |
| 📊 Model Selection Criterion | **AIC (Akaike Information Criterion)** |
| 📐 Evaluation Metric | **MAE (Mean Absolute Error)** |

---

## 💡 Business Insights

- 🔺 **Trend is upward** — overall interest in Pulau Pari tourism has grown over the observation period
- 🔁 **Strong annual seasonality** detected — demand peaks every April and dips every December
- 📣 **Actionable for marketing:** Budget should be front-loaded before April; promotions in Q4 can help stimulate demand during the off-peak window
- 🔮 **SARIMA forecast** successfully captures and replicates seasonal patterns across the 52-week prediction window

---

## 🛠️ Tech Stack & Skills Demonstrated

| Category | Tools / Techniques |
|---|---|
| **Data Wrangling** | `pandas` — datetime indexing, missing value check, column renaming |
| **Time Series EDA** | Trend & seasonality visualization, pattern identification |
| **Decomposition** | `seasonal_decompose` — Additive vs **Multiplicative model** selection with justification |
| **Stationarity Testing** | **ADF Test (Augmented Dickey-Fuller)** — confirmed stationary data |
| **Modeling** | `SARIMAX` — SARIMA with 52-week seasonal period |
| **Hyperparameter Tuning** | **Grid Search** over (p, q) × (P, Q) combinations — selected by lowest AIC |
| **Model Evaluation** | `MAE`, `MSE` — SARIMA significantly outperformed baseline ARIMA |
| **Forecasting** | 52-step ahead forecast preserving seasonal structure |
| **Visualization** | `matplotlib` — actual vs fitted vs forecast plots |

---

## 📁 Project Structure

```
📦 pulau-pari-forecasting
 ┣ 📓 Time Series Analysis.ipynb     # Main analysis notebook
 ┣ 📄 multiTimeline.csv              # Google Trends dataset (weekly)
 ┗ 📄 README.md
```

---

## 🔄 Workflow

```
Raw Data (Google Trends CSV)
        │
        ▼
  Data Loading & Preprocessing
  • Skip header rows
  • Parse datetime index
  • Rename columns
        │
        ▼
  Exploratory Data Analysis
  • Time series visualization
  • Seasonal decomposition
    (Additive → Multiplicative ✓)
  • Extract seasonal peaks/troughs
  • ADF stationarity test → STATIONARY ✓
        │
        ▼
  Baseline Model: ARIMA
        │
        ▼
  Improved Model: SARIMA(p,0,q)(P,1,Q)[52]
  • Grid Search for best (p,q,P,Q)
  • Selected by lowest AIC
        │
        ▼
  Evaluation: MAE & MSE
  (SARIMA >> ARIMA)
        │
        ▼
  52-Week Forecast
```

---

## 📊 Dataset

| Column | Description |
|---|---|
| `Week` | Start date of each week (`YYYY-MM-DD`) |
| `Pulau Pari: (Indonesia)` | Google Trends popularity score (0–100) |

- **Source:** Google Trends
- **Period:** March 2023 – August 2024
- **Frequency:** Weekly
- **Scale:** 0 = no data, 50 = half of peak popularity, 100 = maximum popularity

---

## 🧠 Modeling Decisions

### Why Multiplicative Decomposition?
After comparing both models, **multiplicative** decomposition was chosen because residuals were significantly smaller (range 0–1), indicating that seasonal variation scales proportionally with the trend — a common pattern in tourism data.

### Why SARIMA over ARIMA?
Data showed a clear **52-week seasonal cycle**. Plain ARIMA produced flat forecasts unable to capture this seasonality. SARIMA with `seasonal_order=(P,1,Q)[52]` dramatically reduced MAE by incorporating annual seasonal patterns.

### Why Grid Search?
To avoid manual trial-and-error in selecting `(p, q, P, Q)` parameters, I implemented a systematic **grid search** across all combinations (p, q ∈ [0,1,2] × P, Q ∈ [0,1,2]), selecting the model with the **lowest AIC** for optimal balance between fit and complexity.

---

## 🚀 How to Run

```bash
# Clone the repository
git clone https://github.com/your-username/pulau-pari-forecasting.git
cd pulau-pari-forecasting

# Install dependencies
pip install pandas matplotlib statsmodels scikit-learn

# Launch notebook
jupyter notebook P1LC5_Zafrirah_Aida.ipynb
```

---

## 👩‍💻 About

**Zafirah Aida Adista** — Data Analyst in training, passionate about turning raw data into actionable business insights.

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://linkedin.com/in/your-profile)
[![GitHub](https://img.shields.io/badge/GitHub-Portfolio-181717?style=flat&logo=github&logoColor=white)](https://github.com/your-username)
