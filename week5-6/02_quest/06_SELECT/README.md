## データ検索

### 1. 環境構築
[MySQL 公式サンプルデータベース](https://dev.mysql.com/doc/index-other.html)の [employee data](https://github.com/datacharmer/test_db) のデータをデータベースへ格納
```console
$ apt-get update
$ apt-get install git
$ git clone https://github.com/datacharmer/test_db.git
$ cd test_db
$ mysql -u root -p < employees.sql
Enter password: 
INFO
CREATING DATABASE STRUCTURE
INFO
storage engine: InnoDB
INFO
LOADING departments
INFO
LOADING employees
INFO
LOADING dept_emp
INFO
LOADING dept_manager
INFO
LOADING titles
INFO
LOADING salaries
data_load_time_diff
00:01:38
```

### 2. 全カラムの取得
dept_manager テーブルの全データを * を指定して取得
```console
$ mysql -u test -p
```

```sql
mysql> SHOW databases;
+--------------------+
| Database           |
+--------------------+
| employees          |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| test               |
| test_database      |
+--------------------+
7 rows in set (0.00 sec)

mysql> USE employees;
mysql> SELECT * FROM dept_manager;
+--------+---------+------------+------------+
| emp_no | dept_no | from_date  | to_date    |
+--------+---------+------------+------------+
| 110022 | d001    | 1985-01-01 | 1991-10-01 |
| 110039 | d001    | 1991-10-01 | 9999-01-01 |
| 110085 | d002    | 1985-01-01 | 1989-12-17 |
| 110114 | d002    | 1989-12-17 | 9999-01-01 |
| 110183 | d003    | 1985-01-01 | 1992-03-21 |
| 110228 | d003    | 1992-03-21 | 9999-01-01 |
| 110303 | d004    | 1985-01-01 | 1988-09-09 |
| 110344 | d004    | 1988-09-09 | 1992-08-02 |
| 110386 | d004    | 1992-08-02 | 1996-08-30 |
| 110420 | d004    | 1996-08-30 | 9999-01-01 |
| 110511 | d005    | 1985-01-01 | 1992-04-25 |
| 110567 | d005    | 1992-04-25 | 9999-01-01 |
| 110725 | d006    | 1985-01-01 | 1989-05-06 |
| 110765 | d006    | 1989-05-06 | 1991-09-12 |
| 110800 | d006    | 1991-09-12 | 1994-06-28 |
| 110854 | d006    | 1994-06-28 | 9999-01-01 |
| 111035 | d007    | 1985-01-01 | 1991-03-07 |
| 111133 | d007    | 1991-03-07 | 9999-01-01 |
| 111400 | d008    | 1985-01-01 | 1991-04-08 |
| 111534 | d008    | 1991-04-08 | 9999-01-01 |
| 111692 | d009    | 1985-01-01 | 1988-10-17 |
| 111784 | d009    | 1988-10-17 | 1992-09-08 |
| 111877 | d009    | 1992-09-08 | 1996-01-03 |
| 111939 | d009    | 1996-01-03 | 9999-01-01 |
+--------+---------+------------+------------+
24 rows in set (0.00 sec)
```

### 3. カラムの選択
dept_manager テーブルの emp_no カラムの値のみを取得
```sql
mysql> SELECT emp_no FROM dept_manager;
+--------+
| emp_no |
+--------+
| 110022 |
| 110039 |
| 110085 |
| 110114 |
| 110183 |
| 110228 |
| 110303 |
| 110344 |
| 110386 |
| 110420 |
| 110511 |
| 110567 |
| 110725 |
| 110765 |
| 110800 |
| 110854 |
| 111035 |
| 111133 |
| 111400 |
| 111534 |
| 111692 |
| 111784 |
| 111877 |
| 111939 |
+--------+
24 rows in set (0.00 sec)
```

### 4. カラム名の別名
dept_manager テーブルの emp_no カラムの値のみを  
取得データの見出し（カラム）に「employee_no」という名前を付けて取得
```sql
mysql> SELECT emp_no AS employee_no FROM dept_manager;
+-------------+
| employee_no |
+-------------+
|      110022 |
|      110039 |
|      110085 |
|      110114 |
|      110183 |
|      110228 |
|      110303 |
|      110344 |
|      110386 |
|      110420 |
|      110511 |
|      110567 |
|      110725 |
|      110765 |
|      110800 |
|      110854 |
|      111035 |
|      111133 |
|      111400 |
|      111534 |
|      111692 |
|      111784 |
|      111877 |
|      111939 |
+-------------+
24 rows in set (0.00 sec)
```

### 5. 重複行の削除
dept_manager テーブルの dept_no カラムの値を、重複を削除して取得
```sql
mysql> SELECT DISTINCT dept_no FROM dept_manager;
+---------+
| dept_no |
+---------+
| d001    |
| d002    |
| d003    |
| d004    |
| d005    |
| d006    |
| d007    |
| d008    |
| d009    |
+---------+
9 rows in set (0.00 sec)
```
