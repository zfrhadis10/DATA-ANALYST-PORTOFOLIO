# ✈️ Airline Passenger Satisfaction — Automated ETL Pipeline
### Data Pipeline Automation · PySpark · Apache Airflow · Great Expectations · MongoDB Atlas

![Apache Airflow](https://img.shields.io/badge/Apache%20Airflow-DAG%20Orchestration-017CEE?style=flat&logo=apacheairflow&logoColor=white)
![PySpark](https://img.shields.io/badge/PySpark-Data%20Processing-E25A1C?style=flat&logo=apachespark&logoColor=white)
![MongoDB](https://img.shields.io/badge/MongoDB%20Atlas-NoSQL%20Storage-47A248?style=flat&logo=mongodb&logoColor=white)
![Great Expectations](https://img.shields.io/badge/Great%20Expectations-Data%20Validation-FF6B35?style=flat)
![Docker](https://img.shields.io/badge/Docker-Containerization-2496ED?style=flat&logo=docker&logoColor=white)
![Python](https://img.shields.io/badge/Python-3.x-3776AB?style=flat&logo=python&logoColor=white)
![Kaggle](https://img.shields.io/badge/Dataset-Kaggle-20BEFF?style=flat&logo=kaggle&logoColor=white)

---

## 📌 Project Overview

Airlines operate in a highly competitive market where understanding passenger satisfaction is critical to retention and service improvement. But raw survey data arrives incomplete, poorly formatted, and unvalidated — making it unusable for analytics or ML workflows without a reliable pipeline.

This project delivers a **production-style automated ETL pipeline** that:
1. **Validates** raw data quality using **Great Expectations** (7 expectations, all passing)
2. **Extracts** 103,594 passenger records using **PySpark**
3. **Transforms** data — cleaning nulls with median imputation via `approxQuantile()`
4. **Loads** cleaned data into **MongoDB Atlas** via `pymongo`
5. **Orchestrates** the entire flow with **Apache Airflow** on a weekly cron schedule

> *"What is the best strategy for building automated, scalable data workflows that consistently ensure data integrity for downstream analytics?"*

---

## 🎯 Key Deliverables

| Deliverable | Detail |
|---|---|
| 📦 Dataset | **103,594** airline passenger records × 25 fields |
| ✅ Data Validation | **7 Great Expectations** — all `success: true` |
| ⚙️ Processing Engine | **PySpark** — distributed data extraction & transformation |
| 🗄️ Destination | **MongoDB Atlas** — `airline_db.passenger_satisfaction` |
| 🔁 Orchestration | **Apache Airflow DAG** — 3 tasks, weekly cron schedule |
| 🐳 Infrastructure | **Docker** — Airflow & dependencies containerized via `docker-compose` |
| 🕐 Schedule | Every Saturday 09:10–09:30 AM, every 10 minutes |
| 🧹 Cleaning | Median imputation for 310 nulls in `Arrival Delay in Minutes` |

---

## 🛠️ Tech Stack & Skills Demonstrated

| Category | Tools / Techniques |
|---|---|
| **Pipeline Orchestration** | **Apache Airflow** — DAG definition, `BashOperator`, cron scheduling, `catchup=True`, `max_active_runs` |
| **Containerization** | **Docker** — Airflow webserver, scheduler, and worker containerized via `docker-compose`; scripts mounted at `/opt/airflow/` |
| **Distributed Processing** | **PySpark** — `SparkSession`, `inferSchema`, `approxQuantile()`, `na.fill()`, `toPandas()` |
| **Data Validation** | **Great Expectations** — `FileDataContext`, `ExpectationSuite`, `Checkpoint`, 7 custom expectations |
| **NoSQL Storage** | **MongoDB Atlas** — `pymongo`, `MongoClient`, `insert_many()`, cloud database connection |
| **Modular Pipeline Design** | Separated ETL into 3 independent Python scripts — `extract.py`, `transform.py`, `load.py` |
| **Cron Scheduling** | `"10,20,30 2 * * 6"` — every Sat 09:10–09:30 AM WIB with UTC+7 offset |
| **Missing Value Strategy** | Median imputation via PySpark `approxQuantile()` — robust to outliers vs mean |
| **Data Type Validation** | GX type-list checks ensuring numerical integrity for aggregation pipelines |

---

## ✅ Great Expectations — Data Validation (7/7 Passed)

All 7 expectations returned `success: true`:

| # | Expectation | Column | Detail |
|---|---|---|---|
| 1 | `expect_column_values_to_be_unique` | `id` | Each row = unique passenger entity, no duplicates |
| 2 | `expect_column_values_to_be_between` | 14 rating columns | All service ratings must be 0–5 |
| 3 | `expect_column_values_to_be_in_set` | `Class` | Only `"Business"`, `"Eco"`, `"Eco Plus"` allowed |
| 4 | `expect_column_values_to_be_in_type_list` | `Flight Distance` | Must be `int64` / `int` for numerical analysis |
| 5 | `expect_column_unique_value_count_to_be_between`  | `Gender` | Exactly 2 unique values (Male / Female) |
| 6 | `expect_column_max_to_be_between`  | `Departure/Arrival Delay` | Max delay within 0–2000 mins operational limit |
| 7 | `expect_column_values_to_be_between` | `Age` | No negative values — min threshold = 0 |

---

## 🔄 ETL Pipeline Walkthrough

### 1️⃣ EXTRACT — `extract_airline_pipeline.py`

```python
spark = SparkSession.builder.appName("airline_extraction").getOrCreate()
df_raw = spark.read.csv(input_file_path, header=True, inferSchema=True)
df_raw.toPandas().to_csv(output_path, index=False)
```

- Reads raw `train.csv` (103,594 rows × 25 columns) using PySpark
- Saves extracted data as intermediate CSV for the transform step

---

### 2️⃣ TRANSFORM — `transform_airline_pipeline.py`

```python
median_val = df.approxQuantile("Arrival Delay in Minutes", [0.5], 0.001)[0]
df_transformed = df.na.fill({"Arrival Delay in Minutes": median_val})
```

- Identifies **310 null values** in `Arrival Delay in Minutes`
- Computes median with `approxQuantile()` (more robust than mean against outliers)
- Fills nulls with computed median, saves as transformed CSV

---

### 3️⃣ LOAD — `load_airline_pipeline.py`

```python
client = MongoClient(mongo_uri)
collection = db["passenger_satisfaction"]
collection.insert_many(df_pandas.to_dict(orient="records"))
```

- Reads transformed CSV via PySpark
- Converts Spark DataFrame → Pandas → list of dicts (JSON-ready)
- Inserts all 103,594 records into **MongoDB Atlas** `airline_db.passenger_satisfaction`

---

### 4️⃣ ORCHESTRATION — `airflow_dag_airline_pipeline.py`

```python
with DAG(
    dag_id="P2M3_Zafirah_Aida_Adista",
    start_date=dt.datetime(2024, 11, 1) + dt.timedelta(hours=7),  # WIB UTC+7
    schedule_interval="10,20,30 2 * * 6",   # Every Sat 09:10–09:30 AM
    catchup=True,
    max_active_runs=1,
    concurrency=1
) as dag:
    extract_data >> transform_data >> load_to_mongodb
```

**DAG Execution Schedule:**

| Run | Day | Time |
|---|---|---|
| 1 | Saturday, 2 Nov 2024 | 09:10 AM |
| 2 | Saturday, 2 Nov 2024 | 09:20 AM |
| 3 | Saturday, 2 Nov 2024 | 09:30 AM |
| 4 | Saturday, 9 Nov 2024 | 09:10 AM |
| ... | every Saturday | 09:10 / 09:20 / 09:30 AM |

---

## 📊 Dataset

| Detail | Info |
|---|---|
| **Source** | [Kaggle — Airline Passenger Satisfaction](https://www.kaggle.com/datasets/teejmahal20/airline-passenger-satisfaction) |
| **Records** | 103,594 passengers |
| **Fields** | 25 columns |
| **Key Features** | Gender, Customer Type, Age, Class, Flight Distance, Departure/Arrival Delay, 14 service ratings, Satisfaction label |
| **Missing Values** | 310 nulls in `Arrival Delay in Minutes` → imputed with median |

---

## 📁 Project Structure

```
📦 airline-etl-pipeline
 ┣ 📓 airline_data_validation_gx.ipynb          # Pre-automation: EDA + Great Expectations validation
 ┣ 🐍 extract_airline_pipeline.py               # ETL Step 1: PySpark CSV extraction
 ┣ 🐍 transform_airline_pipeline.py             # ETL Step 2: PySpark data transformation
 ┣ 🐍 load_airline_pipeline.py                  # ETL Step 3: MongoDB Atlas loading
 ┣ 🐍 airflow_dag_airline_pipeline.py           # Airflow DAG orchestration
 ┣ 📄 data_raw.csv                              # Raw dataset (Kaggle source)
 ┣ 📊 airline_etl_presentation.pdf              # Project presentation slides
 ┗ 📄 README.md
```

---

## 🐳 Infrastructure — Docker Setup

Apache Airflow and all pipeline dependencies run inside **Docker containers** managed via `docker-compose`. This ensures a reproducible, isolated environment regardless of the host machine.

```
┌─────────────────────────────────────────────┐
│              Docker Environment             │
│                                             │
│  ┌─────────────┐   ┌──────────────────────┐ │
│  │  Airflow    │   │   Airflow Scheduler  │ │
│  │  Webserver  │   │   (DAG executor)     │ │
│  │  :8080      │   └──────────────────────┘ │
│  └─────────────┘                            │
│                                             │
│  📁 /opt/airflow/dags/    ← DAG files       │
│  📁 /opt/airflow/scripts/ ← ETL scripts     │
│  📁 /opt/airflow/data/    ← CSV files       │
└─────────────────────────────────────────────┘
         │                        │
         ▼                        ▼
  MongoDB Atlas             Local PySpark
  (Cloud NoSQL)          (inside container)
```

**Key Docker configurations:**
- Airflow webserver accessible at `localhost:8080`
- ETL scripts (`extract`, `transform`, `load`) mounted into `/opt/airflow/scripts/`
- Data files mounted into `/opt/airflow/data/`
- PySpark runs inside the container — no separate Spark cluster needed
- `BashOperator` in DAG calls `python3` directly within the container: `sudo -u airflow python3 /opt/airflow/scripts/...`

---


## 👩‍💻 About

**Zafirah Aida Adista** — Data Engineer & Analyst passionate about building reliable data pipelines and turning raw data into production-ready analytical assets.

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://linkedin.com/in/your-profile)
[![GitHub](https://img.shields.io/badge/GitHub-Portfolio-181717?style=flat&logo=github&logoColor=white)](https://github.com/your-username)
[![Tableau](https://img.shields.io/badge/Tableau-Public%20Profile-E97627?style=flat&logo=tableau&logoColor=white)](https://public.tableau.com/app/profile/zafirah.adista)
