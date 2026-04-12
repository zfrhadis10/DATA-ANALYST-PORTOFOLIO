# 💄 Global Skincare & Beauty E-Store: E-Commerce Analysis
### Business Intelligence | EDA · Descriptive & Inferential Statistics · Tableau Dashboard

![Python](https://img.shields.io/badge/Python-3.x-3776AB?style=flat&logo=python&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-Data%20Wrangling-150458?style=flat&logo=pandas&logoColor=white)
![NumPy](https://img.shields.io/badge/NumPy-Numerical%20Analysis-013243?style=flat&logo=numpy&logoColor=white)
![SciPy](https://img.shields.io/badge/SciPy-Statistical%20Testing-8CAAE6?style=flat&logo=scipy&logoColor=white)
![Seaborn](https://img.shields.io/badge/Seaborn-Visualization-4C72B0?style=flat)
![Matplotlib](https://img.shields.io/badge/Matplotlib-Visualization-11557c?style=flat)
![Tableau](https://img.shields.io/badge/Tableau-Dashboard-E97627?style=flat&logo=tableau&logoColor=white)
![Kaggle](https://img.shields.io/badge/Dataset-Kaggle-20BEFF?style=flat&logo=kaggle&logoColor=white)

---

## 📌 Project Overview

The global skincare and beauty industry is growing rapidly — driven by rising consumer awareness and the shift to online shopping. But with increasing competition and diverse regional preferences, business owners need **data-driven answers** to make the right strategic decisions.

In this project, I act as a **Data Analyst** delivering a full end-to-end analysis for a Global Skincare E-Store client: from problem framing to statistical testing, culminating in an interactive Tableau dashboard.

> *"What are the key factors driving profitability in global skincare e-commerce — and how can the business capitalize on them?"*

---

## 🎯 Key Results

| Analysis | Finding |
|---|---|
| 🏆 Top Category | **Home & Accessories** — $354.7K profit (33.7% of total) |
| 💊 Top Product | **Herbal Essences Bio** — $9.1K profit, far ahead of #2 |
| 🌍 Top Country | **United States** — $206.4K profit, 2x the runner-up |
| 👔 Best Customer Segment | **Corporate** — 45.9% of total profit |
| 📈 Profit Growth | **3–4x increase** from 2020 to 2023 |
| 📦 Quantity per Transaction | Consistent across all categories (**~5.35–5.49 units**) |
| 💸 Discount Impact | Spearman r = **-0.623** (p ≈ 0) — discount **significantly reduces** profit |
| 🚨 Safe Discount Threshold | **≤ 20%** — beyond this, profit risk rises sharply |

---

## 💡 Business Insights & Strategic Recommendations

**1. Guard the two pillars, diversify the rest**
Home & Accessories and Body Care together account for >61% of total profit. These must be protected with solid stock management and bundling strategies — while the remaining categories need product innovation to reduce concentration risk.

**2. Reduce geographic dependency**
The US alone drives a dominant share of global profit. This creates strategic risk. Strengthening promotion in already-stable markets like France, Mexico, and Germany is key to building a more resilient revenue base.

**3. Treat segments differently**
Corporate clients are the most profitable segment — their high profit isn't because they get bigger discounts (they don't), but because transaction values are larger. Consumer segment gets the most discounts but delivers proportionally less profit — discount strategy here needs tightening.

**4. Ride Q3, protect Q1**
September consistently records peak monthly profit; January–February is consistently the weakest. Budget allocation and promotions should be front-loaded for Q3 and used defensively in Q1.

**5. Stop heavy discounting**
The Spearman correlation analysis proves discounts directly erode profit. Transactions with 0% discount yield the highest margins. Keep discounts at ≤20% to maintain positive profit; above 40% is a loss zone.

---

## 🛠️ Tech Stack & Skills Demonstrated

| Category | Tools / Techniques |
|---|---|
| **Problem Framing** | **SMART Framework** + **5W+1H** problem decomposition |
| **Data Wrangling** | `pandas` — duplicate check, column standardization, datetime feature engineering |
| **EDA & Visualization** | `matplotlib`, `seaborn` — bar charts, line charts, scatter plots, box plots |
| **Descriptive Statistics** | Mean, Median, Mode per product category using `pandas` groupby |
| **Normality Testing** | Visual & statistical assessment to determine correlation method |
| **Inferential Statistics** | **Spearman Rank Correlation** (`scipy.stats.spearmanr`) — discount vs profit |
| **Dashboard** | **Tableau Public** — interactive multi-chart dashboard with filters |
| **Storytelling** | Narrative analysis connecting each insight to the next business question |

---

## 📊 Dataset

| Detail | Info |
|---|---|
| **Source** | [Kaggle — E-Commerce Analysis: Global Skincare E-Store](https://www.kaggle.com/datasets/shandeep777/e-commerce-analysis-global-skincare-e-store/data) |
| **Period** | January 2020 – December 2023 |
| **Size** | 51,041 rows × 18 columns |
| **Key Columns** | `Order Date`, `Category`, `Product`, `Segment`, `Country`, `Quantity`, `Sales`, `Discount`, `Profit` |

---

## 🔬 Analysis Walkthrough

### 1️⃣ Category & Product Profitability

Aggregated total profit by category and product. Found that **Home & Accessories** dominates at the category level, but the dominance is driven by **consistent performance across many products**, not a single blockbuster. Meanwhile, **Herbal Essences Bio** (Body Care) stands out as the only non-accessory product in the Top 10.

---

### 2️⃣ Geographic Profit Distribution

Grouped profit by country and visualized via horizontal bar chart + Tableau world map. The **US contributes >$206K** — more than double second-place France. China sits at 4th despite having the world's largest beauty market, indicating significant **untapped expansion potential**.

---

### 3️⃣ Customer Segment Analysis

Compared three segments — **Consumer, Corporate, Self-Employed** — across profit contribution, average discount, and % of discounted transactions.

| Segment | Profit % | Avg Discount | % Discounted |
|---|---|---|---|
| Corporate | 45.9% | 14.3% | 43.4% |
| Consumer | 42.0% | 14.5% | 43.9% |
| Self-Employed | 12.1% | 13.8% | 42.3% |

Corporate wins on profit without winning on discounts — **volume and transaction value** are the real driver.

---

### 4️⃣ Profit Trend (2020–2023)

Monthly profit time series revealed a clear growth trajectory from ~$10K in early 2020 to a stable $35–37K range in late 2023. Key seasonal patterns: **Q3 (Sep) is peak**, **Q1 (Jan–Feb) is the annual low**.

---

### 5️⃣ Descriptive Statistics — Quantity per Category

```
Category              Mean    Median    Mode
Body care             5.49      4.0       2
Face care             5.37      3.5       2
Hair care             5.38      3.5       2
Home and Accessories  5.35      3.0       2
Make up               5.38      4.0       2
```

All categories show near-identical means (~5.35–5.49), but median varies — **Body Care and Make Up** have higher median (4 units), while **Home & Accessories** is lower (3 units), suggesting smaller per-transaction volumes for accessories despite their high aggregate profit.

---

### 6️⃣ Inferential Statistics — Does Discount Hurt Profit?

**H₀:** No relationship between discount and profit  
**H₁:** Significant relationship exists

Non-normal distribution → **Spearman Rank Correlation** applied:

```
Spearman rho : -0.623
p-value      : ~0.00000 (< 0.05) → Reject H₀
```

**Conclusion:** Strong negative correlation confirmed. Discounts above 40% dramatically increase loss frequency; above 60%, nearly all transactions become unprofitable.

---

## 📊 Interactive Dashboard

> Built with Tableau Public — featuring profit trend, geographic map, segment comparison, discount-profit scatter, and distribution plots with interactive filters.

**🔗 [View Live Dashboard on Tableau Public](https://public.tableau.com/app/profile/zafirah.adista/viz/Milestone_17724314944580/Dashboard1?publish=yes)**

![Dashboard Preview](https://i.imgur.com/placeholder.png)
*(Screenshot from project presentation)*

---

## 📁 Project Structure

```
📦 global-skincare-ecommerce-analysis
 ┣ 📓 P1M2_Zafirah_Aida.ipynb              # Main analysis notebook
 ┣ 📄 global skincare.xlsx                  # Raw dataset (from Kaggle)
 ┣ 📄 global skincare_cleaned.xlsx          # Cleaned dataset (exported from notebook)
 ┣ 📊 Presentasi_Milestone_2.pdf            # Project presentation slides
 ┗ 📄 README.md
```

---

## 🚀 How to Run

```bash
# Clone the repository
git clone https://github.com/your-username/global-skincare-ecommerce.git
cd global-skincare-ecommerce

# Install dependencies
pip install pandas numpy matplotlib seaborn scipy openpyxl

# Launch notebook
jupyter notebook P1M2_Zafirah_Aida.ipynb
```

---

## 🔗 Related Projects

| Project | Description |
|---|---|
| [Seblak Market Analysis](https://github.com/your-username/seblak-market-analysis) | Tokopedia product analysis using hypothesis testing & confidence intervals |
| [Pulau Pari Time Series Forecasting](https://github.com/your-username/pulau-pari-forecasting) | SARIMA-based 52-week tourism demand forecast |

---

## 👩‍💻 About

**Zafirah Aida Adista** — Data Analyst in training, passionate about turning raw data into actionable business insights.

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://linkedin.com/in/your-profile)
[![GitHub](https://img.shields.io/badge/GitHub-Portfolio-181717?style=flat&logo=github&logoColor=white)](https://github.com/your-username)
[![Tableau](https://img.shields.io/badge/Tableau-Public%20Profile-E97627?style=flat&logo=tableau&logoColor=white)](https://public.tableau.com/app/profile/zafirah.adista)
