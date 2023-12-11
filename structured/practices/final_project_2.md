# Final Project #2

1. Generate dump data minimal 1000 row menggunakan tools apapun, bisa membuat Python script custom sendiri atau menggunakan tools data generator yang tersebar di internet, misalnya **Mockaroo** (n.b. Cari saja di Google "dump data generator")
    
2. Menggunakan skenario yang telah dibuat pada Final Project #1, buatlah 5 fungsionalitas sistem dan Query SQL-nya dengan ketentuan sebagai berikut:

    * 1 Transaction dan Rollback
    * 1 View
    * 1 Stored Procedure
    * 1 Stored Function
    * 1 Trigger

    Kualitas fungsionalitas dinilai berdasarkan **Kompleksitas Query SQL** yang dibuat, sebagaimana tabel di bawah.

    | No. | SQL Query | Kompleksitas |
    |:---:|:---:|:---:|
    | 1 | Where | +1 |
    | 2 | And Or Not | +1 |
    | 3 | Order By | +1 |
    | 4 | Special Operators | +1 |
    | 5 | Join | +(jumlah tabel) |
    | 6 | Aggregate | +1 |
    | 7 | Group by | +1 |
    | 8 | Having | +1 |
    | 9 | Subquery | +(kompleksitas Subquery) |
    | 10 | SQL Functions | +1 |

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
    