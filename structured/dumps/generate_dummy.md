# Generating Random Dummy Data into MySQL Database Using Python

## Requirements
* Faker
* Pandas
* SQLAlchemy

## Getting Started
### A. Init Environment

1. Create Virtualenv with Python3 

    ```bash
    virtualenv -p python3 venv
    ```

2. Activate Virtualenv

    ```bash
    source venv/bin/activate
    ```

3. Install libraries
    ```bash
    pip install pandas Faker sqlalchemy mysqlclient
    ```
    * **Error 1:**
      
      `/bin/sh: pkg-config: command not found`
      
      Solution: Install pkg-config by `brew install pkg-config`

    If it's success:
    ```bash
    Successfully installed Faker-19.11.0 mysqlclient-2.2.0 numpy-1.26.1 pandas-2.1.1 python-dateutil-2.8.2 pytz-2023.3.post1 six-1.16.0 sqlalchemy-2.0.22 typing-extensions-4.8.0 tzdata-2023.3
    ```

### B. Create Script

1. Import libraries
    ```python
    import pandas as pd
    from faker import Faker
    from collections import defaultdict
    from sqlalchemy import create_engine
    from urllib.parse import quote_plus
    import random
    ```

2. Setting MySQL Connection
    ```python
    password = "SebuahPassword"
    db_name = "akademik"
    table_student = "student"
    table_course = "course"
    table_lecturer = "lecturer"
    table_task = "task"

    engine = create_engine('mysql://root:%s@localhost/%s' % (quote_plus(password), db_name), echo=False)
    ```

3. Using Faker to generate dummy student data
    ```python
    def create_dummy_student():
      # create mhs 2019 
      for _ in range(TOTAL_DATA):
        fake_data["name_student"].append(fake.name())
        fake_data["nrp"].append('5027191' + str(_ + 1).zfill(3))
      # create mhs 2020 
      for _ in range(TOTAL_DATA):
        fake_data["name_student"].append(fake.name())
        fake_data["nrp"].append('5027201' + str(_ + 1).zfill(3))
      # create mhs 2021
      for _ in range(TOTAL_DATA):
        fake_data["name_student"].append(fake.name())
        fake_data["nrp"].append('5027211' + str(_ + 1).zfill(3))
      # create mhs 2022
      for _ in range(TOTAL_DATA):
        fake_data["name_student"].append(fake.name())
        fake_data["nrp"].append('5027221' + str(_ + 1).zfill(3))
      # create mhs 2023
      for _ in range(TOTAL_DATA):
        fake_data["name_student"].append(fake.name())
        fake_data["nrp"].append('5027231' + str(_ + 1).zfill(3))
      df_student = pd.DataFrame(fake_data)

      # insert to SQL 
      try:
        df_student.to_sql(table_student, con=engine, index=False, if_exists="append")
        print("Student data has been successfully generated!")
      except Exception as e:
        print(e)
      ```

4. Using Faker to generate dummy course data
    ```python
    def create_dummy_course():
      for _ in range(TOTAL_DATA):
        fake_data["name_course"].append(fake.sentence(nb_words=1, ext_word_list=COURSES))
      df_course = pd.DataFrame(fake_data)

      # insert to SQL 
      try:
        df_course.to_sql(table_course, con=engine, index=False, if_exists="append")
        print("Course data has been successfully generated!")
      except Exception as e:
        print(e)
    ```

5. Using Faker to generate dummy lecturer data
    ```python
    def create_dummy_lecturer():
      for _ in range(TOTAL_DATA):
        fake_data["name_lecturer"].append(fake.name())
        fake_data["nip"].append(str(random.randint(1990, 2022)) + str(random.randint(18, 19)) + str(random.randint(1, 98)).zfill(2) + '1' + str(random.randint(0, 1)) + str(random.randint(1, 200)).zfill(3))
      df_lecturer = pd.DataFrame(fake_data)

      # insert to SQL 
      try:
        df_lecturer.to_sql(table_lecturer, con=engine, index=False, if_exists="append")
        print("Lecturer data has been successfully generated!")
      except Exception as e:
        print(e)
    ```

6. Using Faker to generate dummy task data
    ```python
    def create_dummy_task():
      for _ in range(TOTAL_DATA):
        fake_data["id_mk"].append(random.randint(1, 100))
        fake_data["id_mhs"].append(random.randint(1, 100))
        fake_data["id_dos"].append(random.randint(1, 100))
        fake_data["score"].append(random.randint(1, 100))
        fake_data["desc_task"].append(fake.paragraph(nb_sentences=3, variable_nb_sentences=False))
      df_task = pd.DataFrame(fake_data)

      # insert to SQL 
      try:
        df_task.to_sql(table_task, con=engine, index=False, if_exists="append")
        print("Task data has been successfully generated!")
      except Exception as e:
        print(e)
    ```

[Full Script](generate_dummy.py)


### C. Generate Data

**Requirements:**
* Install MySQL
* Install MySQL GUI (ex: PHPMyAdmin, MySQl Workbench, Table Plus, dll)

1. Make MySQL database and tables
    ```sql
    create database akademik;

    drop table if exists task;
    drop table if exists student;
    drop table if exists course;
    drop table if exists lecturer;

    create table student (
      id SMALLINT NOT NULl AUTO_INCREMENT,
      nrp VARCHAR(18),
      name_student VARCHAR(50),
        PRIMARY KEY (id)
    );

    create table course (
      id SMALLINT NOT NULl AUTO_INCREMENT,
      name_course VARCHAR(100),
      PRIMARY KEY (id)
    );

    create table lecturer (
      id SMALLINT NOT NULl AUTO_INCREMENT,
      nip VARCHAR(18),
      name_lecturer VARCHAR(50),
        PRIMARY KEY (id)
    );

    create table task (
      id SMALLINT NOT NULl AUTO_INCREMENT,
      desc_task VARCHAR(500),
      id_mk SMALLINT,
        id_mhs SMALLINT,
        id_dos SMALLINT,
        score SMALLINT,
        PRIMARY KEY (id),
        FOREIGN KEY (id_mk) REFERENCES course(id),
        FOREIGN KEY (id_mhs) REFERENCES student(id),
        FOREIGN KEY (id_dos) REFERENCES lecturer(id)
    );
    ``` 

    [SQL Script](Createdb20231024.sql)

7. Run the python scripts
    ```bash
    $ python3 generate_dummy.py
    1. Create Dummy Student
    2. Create Dummy Course
    3. Create Dummy Lecturer
    4. Create Dummy Task
    Pilih: 1
    Student data has been successfully generated!
    ```

8. Check your database. Data has been successfully generated!


## Result

Here are the dummy database dumps!

[Database Dumps](Dump20231024.sql)

Please use them to do SQL query exercises!"
