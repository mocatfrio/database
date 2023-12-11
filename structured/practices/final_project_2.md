# Final Project #2

1. Generate dump data minimal 1000 row menggunakan tools apapun, bisa membuat Python script custom sendiri atau menggunakan tools data generator yang tersebar di internet, misalnya **Mockaroo** (n.b. Cari saja di Google "dump data generator")
    
2. Menggunakan skenario yang telah dibuat pada Final Project #1, buatlah 5 fungsionalitas sistem dan Query SQL-nya dengan ketentuan sebagai berikut:

    * 1 Transaction dan Rollback
    * 1 View
    * 1 Stored Procedure
    * 1 Stored Function
    * 1 Trigger

    Kualitas fungsionalitas dinilai berdasarkan **Kompleksitas Query SQL** yang dibuat, sebagaimana tabel di bawah.

    | Kompleksitas | Where | And Or Not | Order by | Special Operators | Join | Aggregate | Group by | Having | Subquery | SQL Functions |
    |:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
    | 2 | :heavy_check_mark: | 
    | 4 | :heavy_check_mark: | :heavy_check_mark: | 
    | 6 | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |
    | 8 | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |  :heavy_check_mark: | 
    | 10 | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |  :heavy_check_mark: | :heavy_check_mark: | 
    | 12 | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |  :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | 
    | 14 | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |  :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | 
    | 16 | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |  :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |
    | 18 | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |  :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |
    | 20 | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |  :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |

4. Buatlah laporan akhir FP sederhana, berisi:

    1. Cover
    2. Deskripsi Sistem / Studi Kasus
    3. Diagram ERD (Final, berdasarkan laporan FP #1)
    4. Deskripsi Tabel dan Kolom (Final, berdasarkan laporan FP #1)
    5. Deskripsi Fungsionalitas
    6. Implementasi SQL (Create tabel, insert dump data) 
    7. Query berdasarkan fungsionalitas

5. Yang dikumpulkan adalah
    * Laporan Akhir FP (PDF)
    * SQL Create DB dan Tabel
    * SQL Insert Dump Data
    * SQL Query
    
    Di compress dalam bentuk ZIP, format penamaan: **NRP1_NRP2_NRP3**
    