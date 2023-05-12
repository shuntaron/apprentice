## テーブル作成・修正・削除

### 1. テーブルの作成
```console
$ mysql -u test -D test -p
```

```sql
mysql> select database();
+------------+
| database() |
+------------+
| test       |
+------------+
1 row in set (0.00 sec)

CREATE TABLE footballers (
  id   INT,
  name VARCHAR(20)
);
Query OK, 0 rows affected (0.10 sec)
```

### 2. テーブルの表示
```sql
mysql> show tables;
+----------------+
| Tables_in_test |
+----------------+
| footballers    |
+----------------+
1 row in set (0.00 sec)
```

### 3. カラムの追加
```sql
mysql> ALTER TABLE footballers ADD age INT;
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

### 4. カラムの表示
```sql
mysql> SHOW COLUMNS FROM footballers;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int         | YES  |     | NULL    |       |
| name  | varchar(20) | YES  |     | NULL    |       |
| age   | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.03 sec)
```

### 5. カラムの削除
```sql
mysql> ALTER TABLE footballers DROP COLUMN age;
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW COLUMNS FROM footballers;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| id    | int         | YES  |     | NULL    |       |
| name  | varchar(20) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)
```

### 6. テーブルの削除


### 7. テーブルの再作成


