# 🏠 Portugal Real Estate: Large-Scale Data Cleaning & Market Analytics

## 🌟 Project Overview
This project focuses on the end-to-end data preprocessing and exploratory analysis of the **Portugal Real Estate Market**. The primary objective was to transform a high-volume, "dirty" dataset into a clean, reliable source for business intelligence. 

By analyzing various property factors—from energy certifications to geographical distribution—this project provides strategic insights into pricing drivers and market trends in Portugal’s real estate sector.

---

## 🛠️ Technical Stack
* **Language:** Python 3.x
* **Core Library:** **Pandas** (High-performance data manipulation)
* **Supporting Libraries:** **NumPy** (Numerical operations), **Matplotlib/Seaborn** (Visualization)
* **Dataset Scale:** **118,682 rows** and **15 columns**.

---

## 🔍 Data Cleaning & Preprocessing Workflow
Handling over **118,000 records** requires precision and memory-efficient techniques. I implemented a multi-stage cleaning pipeline:

### 1. Integrity Audit & Initial Assessment
* Evaluated data structure and identified significant missingness across millions of data points.
* Detected inconsistent data types and "noisy" string patterns in property descriptions.

### 2. Strategic Missing Value Handling
* Conducted a thorough analysis of null values.
* Applied strategic imputation or removal based on the business relevance of each feature to maintain statistical significance across the large sample size.

### 3. Structural Standardization & Transformation
* **String Normalization:** Cleaned and standardized categorical values (e.g., property types, energy certificates).
* **Feature Engineering:** Extracted and refined numerical values from raw text formats for optimized calculation.
* **Type Optimization:** Optimized memory usage by converting object-type columns into appropriate numerical or categorical formats.

### 4. Outlier & Anomaly Detection
* Identified and handled extreme outliers in pricing and area measurements (m²) that could skew market analysis.
* Validated the final cleaned dataset to ensure 100% logical consistency.

---

## 📊 Business Context & Strategy (Brief)
Beyond the technical cleaning, this project bridges the gap between raw data and business strategy:
* **Target:** To identify key drivers (Amenities, Energy Efficiency, Location) that can increase sales by 10% within 6 months.
* **Focus:** Prioritizing high-volume property types (Apartments) and Tier-1 cities (Lisboa, Porto, Sintra) while leveraging "Energy Efficiency" as a premium value-add.

---

## 🚀 Key Learning Outcomes
* **Scalability:** Proven expertise in processing large-scale datasets (**120k+ rows**) using vectorized Pandas operations for maximum efficiency.
* **Data Quality Excellence:** Developed a "Data Quality First" mindset, ensuring that high-level business decisions are backed by accurate, verified data.
* **Insight Extraction:** Ability to synthesize complex technical findings into actionable business recommendations.

---

## 📁 Project Structure & File Descriptions

| File Name | Category | Description |
| :--- | :--- | :--- |
| `portugal_listings_raw.csv` | **Raw Data** | Original dataset with 118,682 records before cleaning. |
| `portugal_listings_clean.csv` | **Processed Data** | Final cleaned dataset optimized for analytics. |
| `portugal_real_estate_cleaning_analysis.ipynb` | **Notebook** | End-to-end Python script for large-scale cleaning & EDA. |
| `Portugal_RealEstate_MarketStrategy.pptx` | **Presentation** | Business strategy and insights for stakeholders. |
| `README.md` | **Documentation** | Project overview, methodology, and key results. |

---
