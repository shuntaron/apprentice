## データを絞り込む

### 1. 指定した行数のみ取得
従業員データ(employees テーブル)を10行のみ取得
```sql
mysql> SELECT * FROM employees LIMIT 10;
+--------+------------+------------+-----------+--------+------------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  |
+--------+------------+------------+-----------+--------+------------+
|  10001 | 1953-09-02 | Georgi     | Facello   | M      | 1986-06-26 |
|  10002 | 1964-06-02 | Bezalel    | Simmel    | F      | 1985-11-21 |
|  10003 | 1959-12-03 | Parto      | Bamford   | M      | 1986-08-28 |
|  10004 | 1954-05-01 | Chirstian  | Koblick   | M      | 1986-12-01 |
|  10005 | 1955-01-21 | Kyoichi    | Maliniak  | M      | 1989-09-12 |
|  10006 | 1953-04-20 | Anneke     | Preusig   | F      | 1989-06-02 |
|  10007 | 1957-05-23 | Tzvetan    | Zielinski | F      | 1989-02-10 |
|  10008 | 1958-02-19 | Saniya     | Kalloufi  | M      | 1994-09-15 |
|  10009 | 1952-04-19 | Sumant     | Peac      | F      | 1985-02-18 |
|  10010 | 1963-06-01 | Duangkaew  | Piveteau  | F      | 1989-08-24 |
+--------+------------+------------+-----------+--------+------------+
10 rows in set (0.01 sec)
```

### 2. 等しいデータの絞り込み
従業員データ(employees テーブル)のうち、女性のデータを10行分取得
```sql
mysql> SELECT * FROM employees WHERE gender = 'F' LIMIT 10;
+--------+------------+------------+------------+--------+------------+
| emp_no | birth_date | first_name | last_name  | gender | hire_date  |
+--------+------------+------------+------------+--------+------------+
|  10002 | 1964-06-02 | Bezalel    | Simmel     | F      | 1985-11-21 |
|  10006 | 1953-04-20 | Anneke     | Preusig    | F      | 1989-06-02 |
|  10007 | 1957-05-23 | Tzvetan    | Zielinski  | F      | 1989-02-10 |
|  10009 | 1952-04-19 | Sumant     | Peac       | F      | 1985-02-18 |
|  10010 | 1963-06-01 | Duangkaew  | Piveteau   | F      | 1989-08-24 |
|  10011 | 1953-11-07 | Mary       | Sluis      | F      | 1990-01-22 |
|  10017 | 1958-07-06 | Cristinel  | Bouloucos  | F      | 1993-08-03 |
|  10018 | 1954-06-19 | Kazuhide   | Peha       | F      | 1987-04-03 |
|  10023 | 1953-09-29 | Bojan      | Montemayor | F      | 1989-12-17 |
|  10024 | 1958-09-05 | Suzette    | Pettey     | F      | 1997-05-19 |
+--------+------------+------------+------------+--------+------------+
10 rows in set (0.00 sec)
```

### 3. 等しくないデータの絞り込み
従業員データ(employees テーブル)のうち、女性でないデータを10行分取得  
その際、否定形の構文を使用
```sql
mysql> SELECT * FROM employees WHERE gender != 'F' LIMIT 10;
+--------+------------+------------+-------------+--------+------------+
| emp_no | birth_date | first_name | last_name   | gender | hire_date  |
+--------+------------+------------+-------------+--------+------------+
|  10001 | 1953-09-02 | Georgi     | Facello     | M      | 1986-06-26 |
|  10003 | 1959-12-03 | Parto      | Bamford     | M      | 1986-08-28 |
|  10004 | 1954-05-01 | Chirstian  | Koblick     | M      | 1986-12-01 |
|  10005 | 1955-01-21 | Kyoichi    | Maliniak    | M      | 1989-09-12 |
|  10008 | 1958-02-19 | Saniya     | Kalloufi    | M      | 1994-09-15 |
|  10012 | 1960-10-04 | Patricio   | Bridgland   | M      | 1992-12-18 |
|  10013 | 1963-06-07 | Eberhardt  | Terkki      | M      | 1985-10-20 |
|  10014 | 1956-02-12 | Berni      | Genin       | M      | 1987-03-11 |
|  10015 | 1959-08-19 | Guoxiang   | Nooteboom   | M      | 1987-07-02 |
|  10016 | 1961-05-02 | Kazuhito   | Cappelletti | M      | 1995-01-27 |
+--------+------------+------------+-------------+--------+------------+
10 rows in set (0.00 sec)
```

### 4. より大きいデータの絞り込み
従業員データ(employees テーブル)のうち、誕生日が1960年1月1日以降の人のデータを10行分取得
```sql
mysql> SELECT * FROM employees WHERE birth_date > '1960-01-01' LIMIT 10;
+--------+------------+------------+-------------+--------+------------+
| emp_no | birth_date | first_name | last_name   | gender | hire_date  |
+--------+------------+------------+-------------+--------+------------+
|  10002 | 1964-06-02 | Bezalel    | Simmel      | F      | 1985-11-21 |
|  10010 | 1963-06-01 | Duangkaew  | Piveteau    | F      | 1989-08-24 |
|  10012 | 1960-10-04 | Patricio   | Bridgland   | M      | 1992-12-18 |
|  10013 | 1963-06-07 | Eberhardt  | Terkki      | M      | 1985-10-20 |
|  10016 | 1961-05-02 | Kazuhito   | Cappelletti | M      | 1995-01-27 |
|  10021 | 1960-02-20 | Ramzi      | Erde        | M      | 1988-02-10 |
|  10027 | 1962-07-10 | Divier     | Reistad     | F      | 1989-07-07 |
|  10028 | 1963-11-26 | Domenick   | Tempesti    | M      | 1991-10-22 |
|  10032 | 1960-08-09 | Jeong      | Reistad     | F      | 1990-06-20 |
|  10034 | 1962-12-29 | Bader      | Swan        | M      | 1988-09-21 |
+--------+------------+------------+-------------+--------+------------+
10 rows in set (0.01 sec)
```

### 5. あいまいな条件の絞り込み
従業員データ(employees テーブル)のうち、ファーストネームに vi が含まれる人のデータを10行分取得
```sql
mysql> SELECT * FROM employees WHERE first_name LIKE '%vi%' LIMIT 10;
+--------+------------+------------+-----------+--------+------------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  |
+--------+------------+------------+-----------+--------+------------+
|  10027 | 1962-07-10 | Divier     | Reistad   | F      | 1989-07-07 |
|  10030 | 1958-07-14 | Elvis      | Demeyer   | M      | 1994-02-17 |
|  10082 | 1963-09-09 | Parviz     | Lortz     | M      | 1990-01-03 |
|  10102 | 1959-11-04 | Paraskevi  | Luby      | F      | 1994-01-26 |
|  10204 | 1956-12-09 | Nevio      | Ritcey    | F      | 1986-12-04 |
|  10212 | 1959-05-09 | Divier     | Esteva    | M      | 1990-07-11 |
|  10421 | 1959-03-22 | Divine     | Marzano   | M      | 1989-09-12 |
|  10489 | 1958-08-24 | Elvia      | Homond    | M      | 1989-09-10 |
|  10619 | 1961-04-27 | Vivian     | Kusakabe  | M      | 1989-03-24 |
|  10643 | 1957-07-25 | Slavian    | Keirsey   | M      | 1987-11-11 |
+--------+------------+------------+-----------+--------+------------+
10 rows in set (0.01 sec)
```

### 6. 特定の範囲の絞り込み
従業員データ(employees テーブル)のうち、誕生日が1960年1月1日から1960年1月31日までの人のデータを10行分取得
```sql
mysql> SELECT * FROM employees WHERE birth_date BETWEEN '1960-01-01' AND '1960-02-01' LIMIT 10;
+--------+------------+------------+-----------+--------+------------+
| emp_no | birth_date | first_name | last_name | gender | hire_date  |
+--------+------------+------------+-----------+--------+------------+
|  10141 | 1960-01-17 | Shahaf     | Ishibashi | F      | 1993-05-06 |
|  10175 | 1960-01-11 | Aleksandar | Ananiadou | F      | 1988-01-11 |
|  10208 | 1960-01-02 | Xiping     | Klerer    | M      | 1991-12-23 |
|  10352 | 1960-01-28 | Erzsebet   | Ohori     | M      | 1996-01-21 |
|  10366 | 1960-01-25 | Morrie     | Piazza    | M      | 1994-04-11 |
|  10647 | 1960-01-12 | Tesuro     | Bahk      | M      | 1995-09-28 |
|  10893 | 1960-01-30 | Danil      | Kropatsch | M      | 1989-08-23 |
|  11259 | 1960-01-13 | Amalendu   | Gronowski | M      | 1986-12-26 |
|  11353 | 1960-01-30 | Utpal      | Berztiss  | M      | 1986-08-25 |
|  11374 | 1960-01-25 | Remzi      | Matzat    | F      | 1993-12-12 |
+--------+------------+------------+-----------+--------+------------+
10 rows in set (0.00 sec)
```
### 7. かつ


### 8. または


### 9. 含まれる


### 10. 従業員番号


### 11. 誕生日

