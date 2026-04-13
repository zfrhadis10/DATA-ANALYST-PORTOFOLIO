# 📊 Digital Marketing Customer Conversion — Prospect Pruning Analysis
### Final Project · Data Engineering & Data Analytics · End-to-End Pipeline

![Python](https://img.shields.io/badge/Python-3.x-3776AB?style=flat&logo=python&logoColor=white)
![PySpark](https://img.shields.io/badge/PySpark-ETL%20Pipeline-E25A1C?style=flat&logo=apachespark&logoColor=white)
![Apache Airflow](https://img.shields.io/badge/Apache%20Airflow-DAG%20Scheduling-017CEE?style=flat&logo=apacheairflow&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/NeonDB-PostgreSQL-4169E1?style=flat&logo=postgresql&logoColor=white)
![Great Expectations](https://img.shields.io/badge/Great%20Expectations-Data%20Validation-FF6B35?style=flat)
![Looker Studio](https://img.shields.io/badge/Looker%20Studio-Dashboard-4285F4?style=flat&logo=googleanalytics&logoColor=white)
![Kaggle](https://img.shields.io/badge/Dataset-Kaggle-20BEFF?style=flat&logo=kaggle&logoColor=white)

---

## 👥 Team

| Name | Role |
|---|---|
| Zafirah Aida Adista | Data Analyst |
| Muhammad Rafli Febriyanto | Data Analyst |
| Muhamad Imam Ferdiansyah | Data Engineer |

---

## 📌 Project Overview

A digital marketing team is spending **$40M** in ad spend on 8,000 prospects — but not all prospects are worth the same cost. Many low-intent customers drive up acquisition costs without converting.

This project answers one core business question:

> *"What is the most effective method to identify unproductive prospects and determine the optimal pruning threshold to achieve the most efficient Conversion Rate improvement?"*

**Solution:** We built a full end-to-end data pipeline — from raw data extraction through ETL, data modeling, and automated scheduling — and conducted a deep prospect pruning analysis that identified the optimal strategy to **cut AdSpend by ~20% ($8.2M saved) while increasing Conversion Rate from 87.65% to 90.53%**.

---

## 🎯 Key Business Outcomes

| Metric | Baseline | After Optimal Pruning |
|---|---|---|
| Total Prospects | 8,000 | 6,368 |
| Conversion Rate | 87.65% | **90.53% (+2.88%)** |
| Total AdSpend | $40M | **~$31.8M** |
| AdSpend Saved | — | **$8.17M (~20% reduction)** |
| Volume Lost | — | Only 1,632 prospects |
| Savings per Lost Conv | — | **$6,557** (highest precision) |

**Optimal Strategy: Previous Purchase Pruning 10%** — the best balance between CR improvement, budget efficiency, and audience stability.

---

## 🛠️ Tech Stack & Skills Demonstrated

| Category | Tools / Techniques |
|---|---|
| **Data Engineering** | PySpark (ETL), Apache Airflow (DAG `@daily` scheduling), NeonDB → PostgreSQL |
| **Data Modeling** | Star Schema — `fact_marketing_performance` + 3 dimension tables |
| **Data Validation** | Great Expectations — 5 expectations all `success: true` |
| **Data Analysis** | Python (Pandas, NumPy), Quantile-based segmentation (`pd.qcut`), Conversion Gap analysis |
| **Prospect Pruning** | Dynamic threshold simulation across 5 variables × 2 pruning levels |
| **AdSpend Optimization** | Savings per Lost Conv ratio — precision-based budget efficiency metric |
| **Visualization** | Matplotlib, Seaborn — dual-axis charts, bar/horizontal bar, grouped bar |
| **Dashboard** | Looker Studio — interactive marketing performance dashboard |
| **Business Framing** | SMART framework problem statement, SDG 8-aligned recommendations |

---

## 🔄 Data Engineering Pipeline

### ETL Process

```
Kaggle API (kagglehub)
       │
       ▼ EXTRACT
  digital_marketing_campaign_dataset.csv
       │
       ▼ TRANSFORM (PySpark)
  ├── Drop: AdvertisingPlatform, AdvertisingTool
  ├── Type Cast: PagesPerVisit → int, CustomerID → str, Conversion → bool
  ├── Rename: ConversionRate → HistoryCR
  └── Data Modeling → Dimension + Fact Tables
       │
       ▼ LOAD
  Pandas → NeonDB → PostgreSQL (via SQLAlchemy df.to_sql())
```

### Star Schema Data Model

```
dim_customer          fact_marketing_performance       dim_channel
─────────────         ──────────────────────────       ────────────
customer_id (PK) ──►  performance_id (PK)        ◄──  channel_id (PK)
Age                   customer_id (FK)                 campaign_channel
Gender                channel_id (FK)
Income                type_id (FK)             ◄──  dim_campaign_type
                      ad_spend                         ─────────────────
                      click_through_rate               campaign_type_id (PK)
                      conversion_rate                  campaign_type_name
                      website_visits
                      pages_per_visit
                      time_on_site
                      email_opens / clicks
                      previous_purchases
                      loyalty_points
                      conversion
```

### Airflow DAG

```python
dag_id       = "final_project_dag"
start_date   = dt.datetime(2026, 4, 10) + timedelta(hours=7)  # WIB UTC+7
schedule     = "@daily"   # runs every day automatically
```

### Great Expectations — Data Validation (5/5 Passed)

| # | Expectation | Column | Purpose |
|---|---|---|---|
| 1 | `expect_column_values_to_be_unique` | `CustomerID` | No duplicate customer records |
| 2 | `expect_column_values_to_be_in_set` | `CampaignChannel` | Only valid channel labels |
| 3 | `expect_column_values_to_be_in_set` | `Gender` | Only Male / Female |
| 4 | `expect_column_values_to_be_of_type` | `AdSpend` | Must be float for budget calculations |
| 5 | `expect_column_to_exist` | `Conversion` | Target variable must be present |

---

## 🔬 Analysis Walkthrough

### Q1 — Customer Segmentation by Conversion Rate

Segmented 8,000 prospects across 3 dimensions:

**Demographics (Age, Gender, Income):** All groups returned CR > 85% with no significant differences — demographics alone are insufficient for prospect filtering.

**Customer Engagement (11 variables):** Strong positive pattern found — higher engagement consistently = higher CR. Low-engagement segments: 78–81% CR. High-engagement segments: 90%+ CR.

**Top 3 CR Drivers:**
| Variable | Segment | CR |
|---|---|---|
| Email Opens | 8.0–9.0 times | **93.53%** |
| AdSpend | $8,962–$9,997 | **93.00%** |
| Previous Purchases | 3.0–4.0 transactions | **92.72%** |

**Campaign Performance:**
- Best channel: **Referral** (88.31% CR, 1,518 customers)
- Best campaign type: **Conversion** (93.36% CR, 1,939 customers)

---

### Q2 — Most Effective Differentiating Variables

Calculated **Conversion Gap** (Max CR − Min CR) across all 15 variables to identify the biggest signal-to-noise gap:

| Rank | Variable | Min CR | Max CR | Gap |
|---|---|---|---|---|
| 1 | PreviousPurchases | 76.41% | 92.72% | **16.31%** |
| 2 | PagesPerVisit | 77.78% | 92.47% | **14.69%** |
| 3 | EmailOpens | 80.02% | 93.53% | **13.52%** |
| 4 | HistoryCR | 78.13% | 91.13% | **13.00%** |
| 5 | TimeOnSite | 79.13% | 92.00% | **12.88%** |

These 5 variables were selected for prospect pruning simulation.

---

### Q3 — Pruning Effectiveness per Variable

Simulated dynamic threshold pruning at 10% and 20% for each top-5 variable:

| Feature | Strategy | CR (%) | CR Improvement | Volume Loss |
|---|---|---|---|---|
| Previous Purchases | Pruning 10% | **90.53%** | **+2.88%** | 1,632 |
| Previous Purchases | Pruning 20% | 90.74% | +3.09% | 2,451 |
| Pages Per Visit | Pruning 10% | 90.39% | +2.74% | 1,737 |
| Pages Per Visit | Pruning 20% | 90.55% | +2.90% | 2,656 |
| Email Opens | Pruning 20% | 90.07% | +2.42% | 1,959 |
| History CR | Pruning 20% | 89.94% | +2.29% | 1,600 |

**Key insight:** Previous Purchases Pruning 10% is the "sweet spot" — it delivers the 3rd-best CR improvement but loses only 1,632 prospects vs 2,451–2,656 in more aggressive scenarios.

---

### Q4 — AdSpend Optimization

| Feature | Strategy | AdSpend Saved | Conv Dropped | Savings/Lost Conv |
|---|---|---|---|---|
| **Previous Purchases** | **Pruning 10%** | **$8,177,164** | **1,247** | **$6,557** ✅ |
| Pages Per Visit | Pruning 10% | $8,772,660 | 1,351 | $6,493 |
| History CR | Pruning 10% | $4,031,142 | 625 | $6,450 |

Previous Purchase (10%) has the **highest Savings per Lost Conversion** — meaning it's the most financially precise cut: every dollar removed targets the most inefficient segment.

---

## 💡 Final Recommendation — "SMART" Budgeting Strategy

| Letter | Strategy | Detail |
|---|---|---|
| **S** — Selective Pruning | Prune 10% via Previous Purchase | Eliminate low-value segments without sacrificing significant conversions |
| **M** — Maximize Efficiency | Target highest Savings/Lost Conv | $6,557 per conversion sacrificed — best precision in the dataset |
| **A** — Audience Prioritization | Focus on high-intent profiles | Previous Purchase 3–4 & Email Opens 8–9 → CR > 92% |
| **R** — Reallocate Budget | Redirect ~20% saved budget | Move $8.17M to channels/segments with proven conversion correlation |
| **T** — Track & Optimize | Monitor CR, CPA, engagement | Periodic review to ensure strategy stays optimal over time |

---

## 📁 Project Structure

```
📦 digital-marketing-conversion-pruning
 ┣ 📓 Digital Marketing Consumer Conversion Analysis.ipynb                   # Full analysis notebook
 ┣ 📊 Digital Marketing Consumer Conversion Presentation.pdf                 # Project presentation slides
 ┗ 📄 README.md
```

---

## 👩‍💻 About

**Zafirah Aida Adista** — Data Analyst & Data Engineer passionate about building data pipelines and converting raw data into strategic business decisions.

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/zafirah-aida-adista-162ab8379/)
[![GitHub](https://img.shields.io/badge/GitHub-Portfolio-181717?style=flat&logo=github&logoColor=white)](https://github.com/zfrhadis10/DATA-ANALYST-PORTOFOLIO)
[![Tableau](https://img.shields.io/badge/Tableau-Public%20Profile-E97627?style=flat&logo=tableau&logoColor=white)](https://public.tableau.com/app/profile/zafirah.adista)
