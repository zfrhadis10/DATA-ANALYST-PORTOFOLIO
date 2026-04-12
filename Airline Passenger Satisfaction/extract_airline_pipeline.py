# import libraries
import os
import pandas as pd
from pyspark.sql import SparkSession

# Inisialisasi Spark Session
spark = SparkSession.builder \
        .appName("airline_extraction") \
        .getOrCreate()

# Menentukan lokasi sumber data (input) dan hasil ekstraksi (output)
input_file_path = '/opt/airflow/data/train.csv' # path data yang akan diextract
output_path = '/opt/airflow/data/extract_result_airline_passenger_satisfaction.csv' # path data hasil extract

# Membaca file CSV
df_raw = spark.read.csv(input_file_path, header=True, inferSchema=True)
    
# Mengonversi Spark DataFrame ke Pandas untuk penyimpanan file CSV
df_raw.toPandas().to_csv(output_path, index=False)

# Menghentikan sesi Spark
spark.stop()