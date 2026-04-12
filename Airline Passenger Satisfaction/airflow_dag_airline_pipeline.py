# import libraries
import datetime as dt
from airflow import DAG
from airflow.operators.bash import BashOperator

# Definisi automasi dan parameter DAG
with DAG(
    dag_id="P2M3_Zafirah_Aida_Adista" \ 
    "", # nama DAG
    # Pengaturan waktu mulai (WIB: UTC+7)
    start_date=dt.datetime(2024, 11, 1) + dt.timedelta(hours=7),
    # Automasi: Berjalan setiap menit ke-10, 20, dan 30 pada jam 02:00 setiap hari Sabtu
    schedule_interval="10,20,30 2 * * 6",
    # Menjalankan antrean task yang terlewati sejak start_date
    catchup=True,
    # Membatasi hanya 1 proses berjalan di waktu yang sama untuk menjaga stabilitas
    max_active_runs=1, 
    concurrency=1

) as dag:
    # --- TASK DEFINITIONS ---
    # Task 1: Ekstraksi Data
    # Menjalankan script untuk mengambil data mentah dari sumber lokal
    extract_data = BashOperator(
        task_id="extract_data",
        bash_command="sudo -u airflow python3 /opt/airflow/scripts/extract_Zafirah.py"
    )
    # Task 2: Transformasi Data
    # Menjalankan data transformation menggunakan PySpark
    transform_data = BashOperator(
        task_id="transform_data",
        bash_command="sudo -u airflow python /opt/airflow/scripts/transform_Zafirah.py",
    )
    # Task 3: Loading ke Database
    # Loading data hasil transformasi ke MongoDB
    load_to_mongodb = BashOperator(
        task_id="load_to_mongodb",
        bash_command="sudo -u airflow python /opt/airflow/scripts/load_Zafirah.py",
    )

    # Menetapkan urutan eksekusi: Ekstrak -> Transformasi -> Load
    extract_data >> transform_data >> load_to_mongodb

