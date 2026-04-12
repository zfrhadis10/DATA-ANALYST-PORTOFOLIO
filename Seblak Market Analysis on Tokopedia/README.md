# 🌶️ Seblak Market Analysis on Tokopedia
### Business Statistics & Hypothesis Testing | Dropship Feasibility Study

![Python](https://img.shields.io/badge/Python-3.x-3776AB?style=flat&logo=python&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-Data%20Wrangling-150458?style=flat&logo=pandas&logoColor=white)
![SciPy](https://img.shields.io/badge/SciPy-Statistical%20Testing-8CAAE6?style=flat&logo=scipy&logoColor=white)
![NumPy](https://img.shields.io/badge/NumPy-Numerical%20Analysis-013243?style=flat&logo=numpy&logoColor=white)
![Web Scraping](https://img.shields.io/badge/Data%20Source-Web%20Scraping-FF6B35?style=flat)

---

## 📌 Project Overview

Seblak has gone viral — from social media mukbang videos to food challenges — and the demand seems real. But is the hype backed by data?

In this project, I take on the role of a prospective **dropship seller** on Tokopedia with limited capital (enough only for promotion). Using **web-scraped product data** from Tokopedia, I conduct a full statistical analysis to answer one core business question:

> *"Is selling seblak on Tokopedia a viable and profitable dropship business — and how should I price it?"*

---

## 🎯 Key Results

| Analysis | Finding |
|---|---|
| 📦 Dataset | **60 seblak products** scraped from Tokopedia |
| ⭐ Avg Rating | **4.94 / 5.0** — extremely high customer satisfaction |
| 💰 Price Range | Rp 3,190 – Rp 153,000 (highly skewed, outliers present) |
| 📈 Revenue Potential | **Rp 1.28 juta – Rp 7.63 juta/month** per product (95% CI) |
| 🏙️ Price by Region | **No significant difference** between Jabodetabek & non-Jabodetabek sellers |
| 🔗 Price vs Sales | **No significant correlation** — buyers are NOT purely price-driven |

---

## 💡 Business Insights & Recommendations

**1. The market is real and buyers love it**
Average rating of 4.94/5.0 across 60 products confirms that seblak has proven product-market fit. Customers are consistently satisfied — low return risk for a new dropshipper.

**2. Monthly revenue potential is attractive**
With 95% confidence, monthly revenue per product falls between **Rp 1.28M and Rp 7.63M**. Even at the lower bound, this is a meaningful side income from a single product listing.

**3. Location of supplier doesn't matter for pricing**
Mann-Whitney U Test (p-value = 0.99) confirms no significant price difference between Jabodetabek and non-Jabodetabek sellers. This means supplier selection should prioritize **shipping speed and cost** — not location.

**4. Don't race to the bottom on price**
Spearman correlation (p-value = 0.98) shows price has no significant impact on sales volume. This is a critical insight: **competing purely on lowest price is not necessary** and would only hurt profit margins. Quality, presentation, and reviews matter more.

---

## 🛠️ Tech Stack & Skills Demonstrated

| Category | Tools / Techniques |
|---|---|
| **Data Source** | Web scraping (Tokopedia) — prior project |
| **Data Wrangling** | `pandas` — loading, feature engineering (`pendapatan = harga × terjual`) |
| **Descriptive Statistics** | Mean, Median, Std Dev, Skewness, Kurtosis — with business interpretation |
| **Inferential Statistics** | Confidence Interval (95%) using `scipy.stats.norm.interval` |
| **Normality Testing** | **Shapiro-Wilk Test** — to determine parametric vs non-parametric approach |
| **Hypothesis Testing** | **Mann-Whitney U Test** (non-parametric, two-sided) for regional price comparison |
| **Correlation Analysis** | **Spearman Correlation** (non-parametric) for price vs sales relationship |
| **Business Framing** | **SMART Framework** — Specific, Measurable, Achievable, Relevant, Time-bound |

---

## 📊 Dataset

| Column | Description |
|---|---|
| `nama produk` | Product name |
| `harga produk` | Listed price (IDR) |
| `penjual` | Seller name |
| `kota toko` | Seller city |
| `banyaknya terjual` | Units sold (monthly proxy) |
| `rating produk` | Product rating (0–5) |

- **Source:** Tokopedia (web scraped)
- **Records:** 60 products
- **Scope:** Seblak keyword search results

---

## 🔬 Analysis Walkthrough

### 1️⃣ Descriptive Statistics — Understanding the Market

Three key variables were analyzed: **price**, **units sold**, and **rating**.

- **Price** is heavily right-skewed (skewness = +2.61, kurtosis = 10.05) — most products are in the Rp 3,000–4,000 range, but a few premium products pull the mean up to Rp 19,891. The median (Rp 3,740) is a far better representation of the typical price.
- **Units Sold** shows extreme variation (std = 386) with a few bestseller outliers driving the mean up — median (70 units) is more representative.
- **Rating** is remarkably consistent at near-perfect levels (mean 4.94, std 0.09) — a strong positive market signal.

> *Outliers in price and units sold are natural (organic market dynamics) and were intentionally retained per analysis scope.*

---

### 2️⃣ Confidence Interval — Revenue Potential

A new feature `pendapatan` (revenue = price × units sold) was engineered, then a **95% Confidence Interval** was computed assuming normal distribution:

```
95% CI: Rp 1,284,356 — Rp 7,635,361 per product per month
```

This gives a realistic minimum and maximum expectation for a new dropshipper entering the market.

---

### 3️⃣ Hypothesis Test — Regional Price Difference

**H₀:** No significant price difference between Jabodetabek and non-Jabodetabek sellers  
**H₁:** Significant price difference exists

Both groups failed the Shapiro-Wilk normality test → **Mann-Whitney U Test** applied (non-parametric).

```
U-statistic: ~  
p-value: 0.9928 > 0.05 → Fail to reject H₀
```

**Result:** No significant regional price difference. Supplier location is not a cost factor.

---

### 4️⃣ Correlation Test — Does Price Drive Sales?

**H₀:** Price does not affect sales volume  
**H₁:** Price significantly affects sales volume

Data is non-normal → **Spearman Rank Correlation** applied.

```
Spearman r: (near 0)  
p-value: 0.9825 > 0.05 → Correlation not significant
```

**Result:** Price and sales volume have no meaningful relationship. Buyers are not purely price-sensitive — product quality, reviews, and presentation drive purchase decisions more.

---

## 📁 Project Structure

```
📦 seblak-market-analysis
 ┣ 📓 P1G5_Zafirah_Aida.ipynb            # Main analysis notebook
 ┣ 📄 P0G3_Zafirah_Aida_data_bersih.csv  # Cleaned Tokopedia scrape data
 ┗ 📄 README.md
```

---

## 🚀 How to Run

```bash
# Clone the repository
git clone https://github.com/your-username/seblak-market-analysis.git
cd seblak-market-analysis

# Install dependencies
pip install pandas numpy scipy

# Launch notebook
jupyter notebook P1G5_Zafirah_Aida.ipynb
```

---

## 🔗 Related Projects

| Project | Description |
|---|---|
| [Tokopedia Web Scraping](https://github.com/your-username/tokopedia-scraper) | P0GC3 — data collection via web scraping that feeds this analysis |
| [Pulau Pari Time Series Forecasting](https://github.com/your-username/pulau-pari-forecasting) | SARIMA-based 52-week tourism demand forecast |

---

## 👩‍💻 About

**Zafirah Aida Adista** — Data Analyst in training, passionate about turning raw data into actionable business insights.

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://linkedin.com/in/your-profile)
[![GitHub](https://img.shields.io/badge/GitHub-Portfolio-181717?style=flat&logo=github&logoColor=white)](https://github.com/your-username)
