# Practice 2
 
Learning SQL Basic Query #2
  * Aggregate
  * Grouping
  * Having
  * Subqueries

## Aggregate

| Fungsi Agregat | Deskripsi | Contoh Penggunaan |
| --- | --- | --- |
| `COUNT()` | Menghitung jumlah baris atau nilai dalam suatu kolom. | `SELECT COUNT(*) FROM table_name;` |
| `SUM()` | Menghitung jumlah total dari suatu kolom numerik. | `SELECT SUM(column_name) FROM table_name;` |
| `AVG()` | Menghitung rata-rata dari suatu kolom numerik. | `SELECT AVG(column_name) FROM table_name;` |
| `MIN()` | Mengambil nilai terkecil dari suatu kolom. | `SELECT MIN(column_name) FROM table_name;` |
| `MAX()` | Mengambil nilai terbesar dari suatu kolom. | `SELECT MAX(column_name) FROM table_name;` |
| `GROUP_CONCAT()` | Menggabungkan nilai-nilai dari suatu kolom dalam satu baris. | `SELECT GROUP_CONCAT(column_name) FROM table_name;` |
| `COUNT(DISTINCT)` | Menghitung jumlah nilai unik dalam suatu kolom. | `SELECT COUNT(DISTINCT column_name) FROM table_name;` |

## Grouping 

Grouping dalam SQL adalah proses mengelompokkan baris berdasarkan nilai tertentu dalam satu atau lebih kolom. Ini memungkinkan Anda untuk menerapkan fungsi agregat seperti COUNT(), SUM(), AVG(), dll., pada setiap kelompok data.

Syntax:

```sql
SELECT column_name
FROM table_name
[WHERE condition ]
[GROUP BY column_name ];
```

Contoh penggunaan GROUP BY dalam SQL:

Misalnya kita memiliki tabel "orders" dengan kolom "customer_name" dan "total_amount":

| customer_name | total_amount |
| ------------- | ------------ |
| John          | 100          |
| Jane          | 200          |
| John          | 150          |
| Bob           | 300          |
| Jane          | 50           |

Berapa total jumlah pesanan untuk setiap pelanggan?

```sql
SELECT customer_name, SUM(total_amount) as total_orders
FROM orders
GROUP BY customer_name;
```

Output:

| customer_name | total_orders |
| ------------- | ------------ |
| John          | 250          |
| Jane          | 250          |
| Bob           | 300          |

## Having 

HAVING digunakan bersama dengan GROUP BY dalam SQL untuk memberikan kondisi atau kriteria tambahan pada hasil yang dikelompokkan. HAVING memungkinkan kita untuk melakukan filter pada hasil agregasi.

Syntax:

```sql
SELECT columnlist
FROM tablelist
[WHERE conditionlist ]
[GROUP BY columnlist ]
[HAVING conditionlist ];
```

Contoh penggunaan HAVING:

Misalnya kita memiliki tabel "orders" dengan kolom "customer_name" dan "total_amount":

| customer_name | total_amount |
| ------------- | ------------ |
| John          | 100          |
| Jane          | 200          |
| John          | 150          |
| Bob           | 300          |
| Jane          | 50           |

Berapa pelanggan yang memiliki total pesanan lebih dari 200?

```sql
SELECT customer_name, SUM(total_amount) as total_orders
FROM orders
GROUP BY customer_name
HAVING total_orders > 200;
```

Output:

| customer_name | total_orders |
| ------------- | ------------ |
| Bob           | 300          |

## Subquery

Subquery (sub-queries atau nested queries) dalam SQL adalah query yang terdapat di dalam query utama. Subquery dapat digunakan di berbagai bagian dari pernyataan SQL, seperti dalam klausa WHERE, FROM, SELECT, dan lain-lain.

Subquery
  * Dalam WHERE
  * Dalam HAVING
  * 

Contoh penggunaan subquery:

Misalnya Anda memiliki dua tabel, "customers" dan "orders", seperti berikut:

| customer_id | customer_name |
| ------------| ------------- |
| 1           | John          |
| 2           | Jane          |
| 3           | Bob           |

| order_id | customer_id | total_amount |
| ---------| ------------| ------------ |
| 101      | 1           | 100          |
| 102      | 2           | 200          |
| 103      | 1           | 150          |
| 104      | 3           | 300          |
| 105      | 2           | 50           |

### Contoh 1 (Subquery dalam WHERE)

Tampilkan nama pelangan yang memiliki jumlah pesanan > 200

```sql
SELECT customer_name
FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders WHERE total_amount > 200);
```

Output:

| customer_name |
| ------------- |
| Jane          |
| Bob           |

### Contoh 2 (Subquery dalam FROM)

Tampilkan nama pelangan dan total pesanan

```sql
SELECT customer_name, total_orders
FROM (
    SELECT customer_id, SUM(total_amount) as total_orders
    FROM orders
    GROUP BY customer_id
) as order_summary
JOIN customers ON order_summary.customer_id = customers.customer_id;
```

Output:

| customer_name | total_orders |
| ------------- | ------------ |
| John          | 250          |
| Jane          | 250          |
| Bob           | 300          |

### Contoh 3 (Subquery dalam SELECT)

Tampilkan nama pelangan dan jumlah pesanan

```sql
SELECT customer_name, 
       (SELECT COUNT(*) FROM orders WHERE orders.customer_id = customers.customer_id) as order_count
FROM customers;
```

Output:

| customer_name | order_count |
| ------------- | ----------- |
| John          | 2           |
| Jane          | 2           |
| Bob           | 1           |


### Contoh 4 (Subquery dalam HAVING)

Tampilkan nama pelanggan yang memiliki lebih dari satu pesanan

```sql
SELECT customer_name, COUNT(order_id) as total_orders
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customer_name
HAVING COUNT(order_id) > 1;
```

Output:

| customer_name | total_orders |
| ------------- | ------------ |
| John          | 2            |
| Jane          | 2            |


## Let's Practice!

1. Tampilkan deskripsi tugas, nama mata kuliah, dan nama dosen dari tugas yang paling banyak dikerjakan oleh mahasiswa
2. Tampilkan nama mata kuliah dan nama dosen yang memiliki paling banyak jenis tugas
3. Tampilkan deskripsi tugas, nama mata kuliah, dan nama dosen dari tugas yang memiliki rata-rata nilai antara 70 sampai 80
4. Tampilkan nama mahasiswa, NRP, dan nilai yang memiliki nilai dibawah rata-rata pada tugas yang memiliki kata 'car' di deskripsi
5. Tampilkan deskripsi tugas, nama mata kuliah, dan nama dosen dari tugas yang memiliki nilai rata-rata dibawah rata-rata nilai semua tugas
