# Import libraries
from pyspark.sql import SparkSession # untuk pengolahan data
from pymongo import MongoClient # driver untuk interaksi dengan database MongoDB
import pandas as pd # untuk menjembatani konversi data ke format JSON

# Inisialisasi Spark Session
spark = SparkSession.builder \
    .appName("Airline_Data_Loading") \
    .getOrCreate()

# Menentukan path file input
file_path = '/opt/airflow/data/transform_result_airline_passenger_satisfaction.csv' # dataset hasil transformasi

# Setup koneksi ke MongoDB Atlas Cloud
mongo_uri = "mongodb+srv://development:development@cluster0.igwloo8.mongodb.net/?retryWrites=true&w=majority"
client = MongoClient(mongo_uri)

# Menentukan nama database dan tabel (collection)
db = client["airline_db"] # nama database
collection = db["passenger_satisfaction"] # nama collection

# Membaca data CSV hasil transformasi menggunakan Spark
df_spark = spark.read.csv(file_path, header=True, inferSchema=True)

# Mengonversi data dari format Spark ke format Pandas
df_pandas = df_spark.toPandas()

# Transformasi data ke format list of dictionaries (format JSON MongoDB)
data_dict = df_pandas.to_dict(orient="records")

# Loading data ke MongoDB Atlas
# Data langsung di-insert ke dalam collection yang sudah ditentukan
collection.insert_many(data_dict)

# Menghentikan Spark Session setelah selesai
spark.stop()