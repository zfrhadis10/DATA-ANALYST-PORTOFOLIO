# 👋 Hi, I'm Zafirah Aida Adista
### Data Analyst · Data Engineer | Python · SQL · PySpark · Tableau · Airflow

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://linkedin.com/in/your-profile)
[![Tableau](https://img.shields.io/badge/Tableau-Public%20Profile-E97627?style=flat&logo=tableau&logoColor=white)](https://public.tableau.com/app/profile/zafirah.adista)
[![Email](https://img.shields.io/badge/Email-Contact%20Me-D14836?style=flat&logo=gmail&logoColor=white)](mailto:your-email@gmail.com)

---

## 👩‍💻 About Me

I'm a data professional with end-to-end skills spanning **data analysis**, **statistical testing**, **data engineering**, and **pipeline automation**. I enjoy translating raw, messy data into structured insights and automated systems that businesses can actually act on.

My work covers the full data lifecycle — from scraping and cleaning raw data, through statistical analysis and visualization, to building production-style ETL pipelines with distributed computing and workflow orchestration.

**Core skills:**
`Python` `SQL` `PySpark` `Apache Airflow` `Docker` `Google BigQuery` `PostgreSQL` `MongoDB` `Tableau` `Great Expectations` `Pandas` `Scipy` `Statsmodels` `Seaborn` `Matplotlib`

---

## 🗂️ Project Portfolio

| # | Project | Domain | Key Skills | Tools |
|---|---|---|---|---|
| 1 | [✈️ Airline ETL Pipeline](#1-️-airline-passenger-satisfaction--automated-etl-pipeline) | Data Engineering | ETL Automation, DAG Scheduling, Data Validation | Airflow · PySpark · Docker · MongoDB · GX |
| 2 | [🏭 The Look Data Warehouse](#2--the-look-e-commerce--data-warehouse--etl-pipeline) | Data Engineering | Data Modeling, Star Schema, ETL | PySpark · BigQuery · PostgreSQL |
| 3 | [💄 Global Skincare E-Commerce](#3--global-skincare--beauty-e-commerce-analysis) | Data Analytics | EDA, Statistics, Dashboard | Python · SciPy · Tableau |
| 4 | [🌶️ Seblak Market Analysis](#4-️-seblak-market-analysis-on-tokopedia) | Data Analytics | Hypothesis Testing, Business Stats | Python · SciPy · Pandas |
| 5 | [🏝️ Pulau Pari Forecasting](#5-️-pulau-pari-tourism-demand-forecasting) | Data Analytics | Time Series, SARIMA, Forecasting | Python · Statsmodels |

---

## 1. ✈️ Airline Passenger Satisfaction — Automated ETL Pipeline

[![Repo](https://img.shields.io/badge/GitHub-Repository-181717?style=flat&logo=github)](https://github.com/zfrhadis10/DATA-ANALYST-PORTOFOLIO/tree/main)
![Airflow](https://img.shields.io/badge/Airflow-Pipeline-017CEE?style=flat&logo=apacheairflow&logoColor=white)
![PySpark](https://img.shields.io/badge/PySpark-Processing-E25A1C?style=flat&logo=apachespark&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-Container-2496ED?style=flat&logo=docker&logoColor=white)
![MongoDB](https://img.shields.io/badge/MongoDB-NoSQL-47A248?style=flat&logo=mongodb&logoColor=white)
![Great Expectations](https://img.shields.io/badge/Great%20Expectations-Validation-FF6B35?style=flat)

**Problem:** Airline passenger survey data arrives raw, incomplete, and manually handled — with no automated quality checks or standardized storage.

**Solution:** Built a fully automated ETL pipeline that validates, processes, and loads 103,594 passenger records into MongoDB Atlas — scheduled weekly via Apache Airflow running in Docker.

### 🔑 Key Skills Demonstrated
- **Apache Airflow DAG** — 3-task orchestration (`extract_data >> transform_data >> load_to_mongodb`) with `BashOperator`, `catchup=True`, `max_active_runs=1`
- **ETL Scheduling** — Cron `"10,20,30 2 * * 6"` runs the full pipeline every Saturday 09:10–09:30 AM WIB automatically, zero manual intervention
- **Docker** — Airflow webserver + scheduler containerized via `docker-compose`; ETL scripts and data files mounted at `/opt/airflow/`
- **PySpark** — Distributed data extraction and transformation; `approxQuantile()` for robust median imputation
- **Great Expectations** — 7 custom expectations all `success: true`, including 3 self-researched non-lecture expectations
- **MongoDB Atlas** — Cloud NoSQL storage via `pymongo`; `insert_many()` bulk insert to `airline_db.passenger_satisfaction`

### 📊 Results
| Metric | Value |
|---|---|
| Records processed | 103,594 passengers |
| Data quality checks | 7/7 expectations passed |
| Nulls handled | 310 rows in `Arrival Delay in Minutes` |
| Pipeline schedule | Every Saturday, 3x per week (09:10 / 09:20 / 09:30 AM) |

### 📁 Files
```
airflow_dag_airline_pipeline.py     # Airflow DAG
extract_airline_pipeline.py         # PySpark extraction
transform_airline_pipeline.py       # PySpark transformation
load_airline_pipeline.py            # MongoDB loading
airline_data_validation_gx.ipynb    # Great Expectations notebook
```

---

## 2. 🏭 The Look E-Commerce — Data Warehouse & ETL Pipeline

[![Repo](https://img.shields.io/badge/GitHub-Repository-181717?style=flat&logo=github)](https://github.com/zfrhadis10/DATA-ANALYST-PORTOFOLIO/tree/main)
![PySpark](https://img.shields.io/badge/PySpark-Processing-E25A1C?style=flat&logo=apachespark&logoColor=white)
![BigQuery](https://img.shields.io/badge/BigQuery-Source-4285F4?style=flat&logo=googlebigquery&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Warehouse-4169E1?style=flat&logo=postgresql&logoColor=white)

**Problem:** The Look's transactional data is scattered across 6 unstructured BigQuery tables (~1M+ rows), making it impossible to run reliable business analytics.

**Solution:** Designed and built a Star Schema Data Warehouse in PostgreSQL, with a full PySpark ETL pipeline to extract, clean, model, and load data from BigQuery.

### 🔑 Key Skills Demonstrated
- **Star Schema Design** — 1 Fact Table (`fact_sales`) + 5 Dimension Tables with grain at order-item level
- **PySpark Multi-Table Join** — 5-table join chain to construct `fact_sales` with FK resolution
- **Data Modeling** — Defined business grain, identified fact/dimension tables, justified Star Schema over Snowflake
- **PySpark Data Cleaning** — Column pruning, `dropna()`, `fillna()`, null-string detection with `rlike()` + `regexp_replace()`
- **Date Dimension Engineering** — Extracted `day`, `month`, `quarter`, `year`, `is_weekend` from raw timestamp; `date_id` as YYYYMMDD integer PK
- **PostgreSQL DDL** — Created database schema with proper PK/FK constraints; loaded via PySpark JDBC (`org.postgresql.Driver`)
- **Google BigQuery** — Extracted 6 source tables (~1M+ rows total) via SQL queries

### 📊 Results
| Table | Rows |
|---|---|
| users | ~100K |
| order_items | ~250K |
| inventory | ~490K |
| **fact_sales** | Aggregated from all above |

### 📁 Files
```
thelook_etl_pipeline.ipynb          # Full ETL notebook
extract_queries.sql                 # BigQuery SQL queries
datawarehouse_ddl_zafirah.sql       # PostgreSQL DDL
thelook_etl_presentation.pdf        # Project presentation
```

---

## 3. 💄 Global Skincare & Beauty E-Commerce Analysis

[![Repo](https://img.shields.io/badge/GitHub-Repository-181717?style=flat&logo=github)](https://github.com/zfrhadis10/DATA-ANALYST-PORTOFOLIO/tree/main)
[![Tableau](https://img.shields.io/badge/Tableau-Live%20Dashboard-E97627?style=flat&logo=tableau&logoColor=white)](https://public.tableau.com/app/profile/zafirah.adista/viz/Milestone_17724314944580/Dashboard1?publish=yes)
![Python](https://img.shields.io/badge/Python-Analysis-3776AB?style=flat&logo=python&logoColor=white)
![SciPy](https://img.shields.io/badge/SciPy-Statistics-8CAAE6?style=flat)

**Problem:** A global skincare e-store needs to understand what drives profitability across products, geographies, and customer segments — and whether discount strategies are helping or hurting.

**Solution:** End-to-end analysis of 51,041 transactions (2020–2023) with 6 analytical questions answered through EDA, descriptive statistics, inferential testing, and an interactive Tableau dashboard.

### 🔑 Key Skills Demonstrated
- **SMART Framework + 5W+1H** — Structured problem framing before any analysis
- **EDA & Visualization** — Bar charts, line charts, scatter plots, box plots with business insights per visual
- **Descriptive Statistics** — Mean, Median, Mode per product category
- **Normality Testing** — Shapiro-Wilk to determine parametric vs non-parametric approach
- **Spearman Rank Correlation** — Tested discount vs profit relationship; Spearman r = -0.623, p ≈ 0 → strong negative correlation confirmed
- **Tableau Dashboard** — Interactive multi-chart dashboard with world map, filters by segment/product/city
- **Business Storytelling** — Each analysis narratively connected to the next business question

### 📊 Key Findings
| Finding | Detail |
|---|---|
| Top category | Home & Accessories — $354.7K (33.7% of total profit) |
| Top country | United States — $206.4K, 2x the runner-up |
| Best segment | Corporate — 45.9% of total profit |
| Discount insight | Every 1% increase in discount → significant profit drop (r = -0.623) |
| Safe discount cap | ≤ 20%; above 40% = loss zone |

### 📁 Files
```
P1M2_Zafirah_Aida.ipynb             # Analysis notebook
thelook_etl_presentation.pdf        # Project presentation
```
🔗 **[View Live Tableau Dashboard](https://public.tableau.com/app/profile/zafirah.adista/viz/Milestone_17724314944580/Dashboard1?publish=yes)**

---

## 4. 🌶️ Seblak Market Analysis on Tokopedia

[![Repo](https://img.shields.io/badge/GitHub-Repository-181717?style=flat&logo=github)](https://github.com/zfrhadis10/DATA-ANALYST-PORTOFOLIO/tree/main)
![Python](https://img.shields.io/badge/Python-Analysis-3776AB?style=flat&logo=python&logoColor=white)
![SciPy](https://img.shields.io/badge/SciPy-Statistics-8CAAE6?style=flat)

**Problem:** Is selling seblak on Tokopedia a viable dropship business — and does location or price actually affect sales?

**Solution:** Full statistical analysis of 60 web-scraped Tokopedia products using confidence intervals, hypothesis testing, and correlation analysis to answer 4 business questions.

### 🔑 Key Skills Demonstrated
- **Confidence Interval (95%)** — Estimated monthly revenue potential: Rp 1.28M – Rp 7.63M per product
- **Normality Testing** — Shapiro-Wilk on both groups before hypothesis test
- **Mann-Whitney U Test** — Non-parametric regional price comparison (Jabodetabek vs non-Jabodetabek); p = 0.9928 → no significant difference
- **Spearman Correlation** — Price vs sales volume; p = 0.9825 → price has no significant effect on sales
- **Feature Engineering** — Created `pendapatan` column (price × units sold) for revenue analysis
- **Business Translation** — Statistical results converted to actionable supplier and pricing strategy

### 📊 Key Findings
| Question | Result |
|---|---|
| Revenue potential | Rp 1.28M – Rp 7.63M/month (95% CI) |
| Jabodetabek vs non-Jabodetabek prices | No significant difference (p = 0.99) |
| Does price drive sales? | No (p = 0.98) — quality & reviews matter more |
| Avg rating | 4.94/5.0 — strong product-market fit |

### 📁 Files
```
P1G5_Zafirah_Aida.ipynb                     # Analysis notebook
P0G3_Zafirah_Aida_data_bersih.csv           # Cleaned Tokopedia dataset
```

---

## 5. 🏝️ Pulau Pari Tourism Demand Forecasting

[![Repo](https://img.shields.io/badge/GitHub-Repository-181717?style=flat&logo=github)](https://github.com/zfrhadis10/DATA-ANALYST-PORTOFOLIO/tree/main)
![Python](https://img.shields.io/badge/Python-Forecasting-3776AB?style=flat&logo=python&logoColor=white)
![Statsmodels](https://img.shields.io/badge/Statsmodels-Time%20Series-4B8BBE?style=flat)

**Problem:** A travel agency needs to predict Pulau Pari tourism popularity for the next 52 weeks to plan marketing campaigns and resource allocation.

**Solution:** Built a SARIMA model with grid search optimization on Google Trends weekly data to produce a 52-week tourism demand forecast with seasonal pattern preservation.

### 🔑 Key Skills Demonstrated
- **Time Series Decomposition** — Additive vs Multiplicative model comparison; chose Multiplicative (residuals range 0–1 vs wide additive residuals)
- **ADF Stationarity Test** — Confirmed data stationarity without differencing needed
- **SARIMA Modeling** — Seasonal component at 52-week period; outperformed baseline ARIMA by capturing annual seasonality
- **Grid Search Hyperparameter Tuning** — Iterated over (p,q) × (P,Q) combinations, selected by lowest AIC
- **52-Week Forecast** — Model preserves seasonal structure (April peak, December trough)
- **MAE & MSE Evaluation** — SARIMA significantly lower error than plain ARIMA

### 📊 Key Findings
| Finding | Detail |
|---|---|
| Peak season | **April** — consistently highest popularity |
| Off-peak season | **December** — consistently lowest |
| Best model | SARIMA (grid search optimized) |
| Forecast horizon | 52 weeks ahead |

### 📁 Files
```
P1LC5_Zafirah_Aida.ipynb            # Forecasting notebook
multiTimeline.csv                   # Google Trends dataset
```

---

## 🧰 Skills Summary

### Data Engineering
| Skill | Projects |
|---|---|
| Apache Airflow (DAG, BashOperator, Cron scheduling) | Airline ETL |
| Docker & docker-compose | Airline ETL |
| PySpark (DataFrame API, joins, aggregations) | Airline ETL, The Look DW |
| Google BigQuery (SQL extraction) | The Look DW |
| PostgreSQL (DDL, JDBC load) | The Look DW |
| MongoDB Atlas (pymongo, insert_many) | Airline ETL |
| Star Schema / Data Modeling | The Look DW |
| Great Expectations (data validation) | Airline ETL |

### Data Analytics
| Skill | Projects |
|---|---|
| Exploratory Data Analysis | Skincare, Seblak |
| Descriptive Statistics (mean, median, mode, skewness, kurtosis) | Skincare, Seblak |
| Confidence Interval | Seblak |
| Hypothesis Testing (Mann-Whitney U, Shapiro-Wilk) | Skincare, Seblak |
| Correlation Analysis (Spearman) | Skincare, Seblak |
| Time Series Analysis & Forecasting (SARIMA) | Pulau Pari |
| Tableau Dashboard | Skincare |
| SMART Framework & Business Framing | Skincare, Seblak |

---

## 📬 Get in Touch

I'm open to Data Analyst and Data Engineer roles. Feel free to reach out!

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://linkedin.com/in/your-profile)
[![Email](https://img.shields.io/badge/Email-Contact%20Me-D14836?style=flat&logo=gmail&logoColor=white)](mailto:your-email@gmail.com)
[![Tableau](https://img.shields.io/badge/Tableau-Public%20Profile-E97627?style=flat&logo=tableau&logoColor=white)](https://public.tableau.com/app/profile/zafirah.adista)
