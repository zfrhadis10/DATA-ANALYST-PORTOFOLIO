/*
Nama : Zafirah Aida Adista
*/

SELECT * from orders;
SELECT * FROM users;
SELECT * FROM products;
SELECT * FROM order_items;

-- Menampilkan data tanggal terlampau hingga tanggal terkini 
SELECT date (created_at) as transaction_date,
COUNT (order_id) as jumlah_transaksi_per_hari
FROM orders
GROUP BY transaction_date
ORDER BY transaction_date ASC;

-- Status pesanan terbanyak hingga terendah tahun 2023
SELECT status, COUNT (order_id) as total_order
FROM orders
WHERE created_at BETWEEN '2023-01-01' AND '2023-12-31' 
GROUP BY status
ORDER BY total_order DESC;


-- Menampilkan daftar 5 bulan dimana jumlah pesanan terbanyak terjadi selama tahun 2021 hingga 2023
SELECT TO_CHAR(created_at, 'Month YYYY') AS Bulan,
COUNT(order_id) AS total_order
FROM orders
WHERE created_at BETWEEN '2021-01-01' AND '2023-12-31'
GROUP BY Bulan
ORDER BY total_order DESC
LIMIT 5;


-- Menampilkan daftar negara dimana pesanan terjadi di 7 hari pertama namun memiliki status akhir 'Returned'
SELECT DISTINCT u.country
FROM orders o
JOIN users u
ON o.user_id = u.id
WHERE O.created_at BETWEEN '2023-01-01' AND '2023-01-07'
AND o.status = 'Returned';

-- 30 customer yang membeli barang dengan total pengeluaran terbesar
SELECT u.id, u.first_name, u.last_name, u.email,
COUNT (DISTINCT oi.order_id) AS total_pesanan,
SUM (o.num_of_item) AS total_barang,
SUM (p.retail_price) AS total_uang
FROM users u
JOIN orders o ON u.id = o.user_id
JOIN order_items oi ON oi.order_id = o .order_id
JOIN products p ON p.id = oi.product_id
WHERE o.created_at BETWEEN '2023-01-01' AND '2023-12-31'
AND o.status NOT IN ('Cancelled', 'Returned')
GROUP BY u.id, u.first_name, u.last_name, u.email
ORDER BY total_uang DESC
LIMIT 30;


-- Brand yang paling banyak dibeli oleh wanita selama bulan Desember 2023
SELECT p.brand,
COUNT (o.order_id) AS jumlah_total_pesanan
FROM products p
JOIN order_items oi
ON p.id = oi.product_id
JOIN orders o
ON oi.order_id = o.order_id
JOIN users u
ON u.id = o.user_id
WHERE u.gender = 'F'
AND o.created_at BETWEEN '2023-12-01' AND '2023-12-31'
GROUP BY p.brand
ORDER BY jumlah_total_pesanan DESC
LIMIT 1;


-- Transaksi yang dibuat pada periode semester pertama 2024
SELECT AVG (shipped_at - created_at) AS rata_rata_durasi_permintaan,
AVG (delivered_at - shipped_at) AS rata_rata_durasi_pengiriman
FROM orders
WHERE created_at BETWEEN '2024-01-01' AND '2024-06-30'
AND status = 'Complete';


-- Mengetahui nilai pendapatan bersih yang diperoleh per tahunnya beserta informasi mengenai jumlah produk yang terjual
SELECT EXTRACT (YEAR from o.created_at) AS tahun,
SUM ((p.retail_price - p.cost) * o.num_of_item) AS total_profit_kotor,
SUM ((p.retail_price - p.cost)* 0.10) AS total_pendapatan_bersih,
COUNT (DISTINCT o.order_id) AS total_pemesanan,
COUNT (oi.id) AS total_item_terjual
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON p.id = oi.product_id
WHERE o.status = 'Complete'
GROUP BY tahun
ORDER BY tahun ASC;




