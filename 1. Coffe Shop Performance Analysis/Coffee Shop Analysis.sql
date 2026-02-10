-- CREATE TABLE
DROP TABLE IF EXISTS coffe_shop;
CREATE TABLE coffe_shop 
			(
			transaction_id INT PRIMARY KEY,
			transaction_date DATE,
			transaction_time TIME,
			transaction_qty INT,
			store_id INT,
			store_location VARCHAR (50),
			product_id INT,
			unit_price FLOAT,
			product_category VARCHAR (50),
			product_type VARCHAR (50),
			product_detail VARCHAR (50)
		);
SELECT * FROM coffe_shop;

-- Menghitung jumlah total baris
SELECT COUNT(*) FROM coffe_shop;

-- Memeriksa Nilai Null
SELECT * 
FROM coffe_shop 
WHERE transaction_id IS NULL 
   OR transaction_date IS NULL 
   OR transaction_time IS NULL
   OR transaction_qty IS NULL
   OR store_id IS NULL
   OR store_location IS NULL
   OR product_id IS NULL
   OR unit_price IS NULL
   OR product_category IS NULL
   OR product_type IS NULL
   OR product_detail IS NULL;

--Memeriksa Rentang Nilai (Harga dan Quantity)
SELECT 
    MIN(transaction_qty) AS min_qty,
    MAX(transaction_qty) AS max_qty,
    AVG(transaction_qty) AS avg_qty,
    MIN(unit_price) AS min_price,
    MAX(unit_price) AS max_price,
    AVG(unit_price) AS avg_price
FROM coffe_shop;

--Memeriksa rentang tanggal
SELECT 
    MIN(transaction_date) AS tanggal_terawal, 
    MAX(transaction_date) AS tanggal_terakhir 
FROM coffe_shop;

--Produk dengan Jumlah Penjualan Terbanyak
SELECT 
    product_detail, 
    SUM(transaction_qty) AS total_produk_terjual
FROM coffe_shop
GROUP BY product_detail
ORDER BY total_produk_terjual DESC
LIMIT 5;

-- Total Pendapatan Harian
SELECT 
    ROUND(MIN(pendapatan_harian)::numeric, 2) AS pendapatan_terendah,
    ROUND(MAX(pendapatan_harian)::numeric, 2) AS pendapatan_tertinggi,
    ROUND(AVG(pendapatan_harian)::numeric, 2) AS rata_rata_pendapatan_harian
FROM (
    SELECT 
        transaction_date, 
        SUM(transaction_qty * unit_price) AS pendapatan_harian
    FROM coffe_shop
    GROUP BY transaction_date
) AS tabel_pendapatan;

-- Rata-rata Transaksi Per Hari
SELECT COUNT(*) / COUNT(DISTINCT transaction_date) AS avg_transaksi_harian
FROM coffe_shop;

-- Kategori produk yang menghasilkan pendapatan tertinggi
SELECT 
    product_category, 
    SUM(transaction_qty * unit_price) AS total_pendapatan
FROM coffe_shop
GROUP BY product_category
ORDER BY total_pendapatan DESC
LIMIT 5;

-- Jam penjualan teramai
SELECT 
    EXTRACT(HOUR FROM transaction_time) AS jam, 
    COUNT(transaction_id) AS total_transaksi,
    ROUND(SUM(transaction_qty * unit_price)::numeric, 2) AS total_pendapatan,
    ROUND(AVG(transaction_qty * unit_price)::numeric, 2) AS nilai_per_transaksi
FROM coffe_shop
GROUP BY 1
ORDER BY 1 ASC;

-- Tren penjualan berdasarkan hari dalam seminggu.
SELECT 
    TO_CHAR(transaction_date, 'Day') AS hari, 
    COUNT(transaction_id) AS jumlah_transaksi,
    ROUND(SUM(transaction_qty * unit_price)::numeric, 2) AS revenue,
    ROUND(AVG(transaction_qty * unit_price)::numeric, 2) AS nilai_per_transaksi
FROM coffe_shop
GROUP BY 1, EXTRACT(DOW FROM transaction_date)
ORDER BY EXTRACT(DOW FROM transaction_date);

-- Tren Harian per Lokasi Store
SELECT hari, store_location, total_transaksi, revenue
FROM (
    SELECT 
        TO_CHAR(transaction_date, 'Day') AS hari,
        store_location,
        COUNT(transaction_id) AS total_transaksi,
        ROUND(SUM(transaction_qty * unit_price)::numeric, 2) AS revenue,
        RANK() OVER(PARTITION BY EXTRACT(DOW FROM transaction_date) ORDER BY COUNT(transaction_id) DESC) as ranking,
        EXTRACT(DOW FROM transaction_date) as dow
    FROM coffe_shop
    GROUP BY 1, 2, dow
) AS tabel_ranking
WHERE ranking = 1
ORDER BY 
    CASE 
        WHEN dow = 0 THEN 7 
        ELSE dow 
    END ASC;

--Perbandingan Performa Lokasi
SELECT 
    store_location, 
    COUNT(transaction_id) AS total_transaksi,
    SUM(transaction_qty) AS total_produk_terjual,
    ROUND(SUM(transaction_qty * unit_price)::numeric, 2) AS total_pendapatan,
    ROUND(AVG(unit_price)::numeric, 2) AS rata_rata_harga_produk
FROM coffe_shop
GROUP BY 1
ORDER BY total_pendapatan DESC;

--Produk Unggulan di Lokasi Teratas
SELECT 
    store_location,
    product_type,
    SUM(transaction_qty) AS total_qty,
    ROUND(SUM(transaction_qty * unit_price)::numeric, 2) AS revenue
FROM coffe_shop
WHERE store_location IN ('Hell''s Kitchen', 'Astoria', 'Lower Manhattan')
GROUP BY 1, 2
ORDER BY 4 DESC;

--Rata-rata Belanja per Pelanggan
SELECT 
    store_location,
    ROUND(AVG(transaction_qty * unit_price)::numeric, 2) AS rata_rata_per_transaksi
FROM coffe_shop
WHERE store_location IN ('Hell''s Kitchen', 'Astoria', 'Lower Manhattan')
GROUP BY 1
ORDER BY 2 DESC;

-- Analisis Keranjang Belanja
SELECT 
    store_location,
    ROUND(AVG(transaction_qty)::numeric, 2) AS avg_item_per_struk,
    ROUND(AVG(transaction_qty * unit_price)::numeric, 2) AS avg_pengeluaran_per_struk,
    MAX(transaction_qty) AS pembelian_item_terbanyak_1_struk
FROM coffe_shop
GROUP BY 1
ORDER BY avg_pengeluaran_per_struk DESC;

-- Kategori produk yang paling bervariasi dan memberikan margin terbesar
SELECT 
    product_category, 
    COUNT(DISTINCT product_type) AS variasi_produk,
    SUM(transaction_qty) AS total_qty,
    ROUND(SUM(transaction_qty * unit_price)::numeric, 2) AS total_revenue
FROM coffe_shop
GROUP BY 1
ORDER BY total_revenue DESC;

-- rata-rata jumlah item yang dibeli pelanggan dalam satu kali transaksi
SELECT 
    ROUND(AVG(transaction_qty)::numeric, 2) AS rata_rata_item_per_transaksi,
    MAX(transaction_qty) AS pembelian_terbanyak_sekaligus
FROM coffe_shop;

-- Produk dengan Kuantitas Terbanyak per Transaksi
SELECT 
    product_type, 
    MAX(transaction_qty) AS jumlah_maksimal_sekali_beli,
    ROUND(AVG(transaction_qty)::numeric, 2) AS rata_rata_qty_per_transaksi,
    SUM(transaction_qty) AS total_unit_terjual
FROM coffe_shop
GROUP BY 1
ORDER BY rata_rata_qty_per_transaksi DESC
LIMIT 10;

-- Produk yang Kurang Laku
SELECT 
    product_type, 
    product_category,
    SUM(transaction_qty) AS total_terjual
FROM coffe_shop
GROUP BY 1, 2
ORDER BY total_terjual ASC
LIMIT 5;

-- Produk dengan Penjualan di Bawah Rata-rata
SELECT 
    product_type, 
    SUM(transaction_qty) AS total_qty,
    ROUND(SUM(transaction_qty * unit_price)::numeric, 2) AS revenue
FROM coffe_shop
GROUP BY 1
HAVING SUM(transaction_qty * unit_price) < (
    SELECT AVG(total_rev) FROM (
        SELECT SUM(transaction_qty * unit_price) AS total_rev 
        FROM coffe_shop GROUP BY product_type
    ) AS sub
)
ORDER BY revenue ASC;


-- Hari dengan Jumlah Transaksi di Atas Rata-rata
SELECT 
    transaction_date, 
    COUNT(transaction_id) AS total_transaksi
FROM coffe_shop
GROUP BY transaction_date
HAVING COUNT(transaction_id) > (
    SELECT COUNT(transaction_id)::float / COUNT(DISTINCT transaction_date) 
    FROM coffe_shop
)
ORDER BY total_transaksi DESC
LIMIT 5;


-- Produk yang Penjualannya di Atas Rata-rata (Berdasarkan Qty)
SELECT 
    product_type, 
    SUM(transaction_qty) AS total_terjual
FROM coffe_shop
GROUP BY product_type
HAVING SUM(transaction_qty) > (
    SELECT AVG(total_qty) 
    FROM (
        SELECT SUM(transaction_qty) AS total_qty 
        FROM coffe_shop 
        GROUP BY product_type
    ) AS rata_rata_produk
)
ORDER BY total_terjual DESC;

--Lokasi Toko dengan Pendapatan di Atas Rata-rata
SELECT 
    store_location, 
    ROUND(SUM(transaction_qty * unit_price)::numeric, 2) AS total_pendapatan
FROM coffe_shop
GROUP BY store_location
HAVING SUM(transaction_qty * unit_price) > 50000
ORDER BY total_pendapatan DESC;


