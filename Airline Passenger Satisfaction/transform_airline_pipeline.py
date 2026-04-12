# Mengambil fungsi utama dari Spark untuk mengolah data tabel
from pyspark.sql import 
# Mengambil tools tambahan untuk memilih kolom spesifik
from pyspark.sql.functions import col
# Mengambil modul sistem untuk berinteraksi dengan penyimpanan file
import os

# Inisialisasi Spark Session
spark = SparkSession.builder \
        .appName("airline_transformation") \
        .getOrCreate()


# Menentukan lokasi file sumber
input_path = '/opt/airflow/data/extract_result_airline_passenger_satisfaction.csv' # Sumber dari hasil Extract
# Menentukan lokasi penyimpanan untuk data hasil akhir
output_path = '/opt/airflow/data/transform_result_airline_passenger_satisfaction.csv' # Lokasi hasil transformasi

# Membaca file data
df = spark.read.csv(input_path, header=True, inferSchema=True)


# Handling Missing Value (Fillna Median) pada kolom 'Arrival Delay in Minutes'
# Hitung median
median_val = df.approxQuantile("Arrival Delay in Minutes", [0.5], 0.001)[0]
print(f"Nilai Median: {median_val}")
# Isi missing value dengan median tersebut
df_transformed = df.na.fill({"Arrival Delay in Minutes": median_val})

# Menyimpan hasil ke CSV
df_transformed.toPandas().to_csv(output_path, index=False)

# Menghentikan sesi Spark
spark.stop()