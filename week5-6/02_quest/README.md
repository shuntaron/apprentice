## インデックス設定

### 1. インデックス設定前
employees データベースの employees テーブルに対して、誕生日が1961年8月3日のレコードを取得  
その際に、EXPLAIN ANALYZE ステートメントを利用することで、実行時間を計測  

```sql
EXPLAIN
SELECT *
FROM employees
WHERE birth_date = '1961-08-03';
+----+-------------+-----------+------------+------+---------------+------+---------+------+--------+----------+-------------+
| id | select_type | table     | partitions | type | possible_keys | key  | key_len | ref  | rows   | filtered | Extra       |
+----+-------------+-----------+------------+------+---------------+------+---------+------+--------+----------+-------------+
|  1 | SIMPLE      | employees | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 299290 |    10.00 | Using where |
+----+-------------+-----------+------------+------+---------------+------+---------+------+--------+----------+-------------+
1 row in set, 1 warning (0.11 sec)
```

### 2. インデックスの作成
employees データベースの employees テーブルの birth_date カラムにインデックスを作成  

```sql
ALTER TABLE employees
ADD INDEX birth_date_index (birth_date);
Query OK, 0 rows affected (3.03 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

### 3. インデックスの確認


### 4. インデックスの効果の確認


### 5. インデックスの説明


### 6. インデックスの削除


### 7. ベストプラクティス


