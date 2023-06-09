## データ集計

### 1. 列の合計値
給与情報(salaries テーブル)から、全データの給与の合計値を取得
```sql
SELECT SUM(salary) FROM salaries;
+--------------+
| SUM(salary)  |
+--------------+
| 181480757419 |
+--------------+
1 row in set (0.68 sec)
```

### 2. 列の平均値
給与情報(salaries テーブル)から、全データの給与の平均値を取得
```sql
SELECT AVG(salary) FROM salaries;
+-------------+
| AVG(salary) |
+-------------+
|  63810.7448 |
+-------------+
1 row in set (0.79 sec)
```

### 3. 四捨五入
給与情報(salaries テーブル)から、全データの給与の平均値を取得  
なお、給与の平均値を四捨五入して整数とする
```sql
SELECT ROUND(AVG(salary)) FROM salaries;
+--------------------+
| ROUND(AVG(salary)) |
+--------------------+
|              63811 |
+--------------------+
1 row in set (0.92 sec)
```

### 4. 列の最大値
給与情報(salaries テーブル)から、全データの給与の最大値を取得
```sql
SELECT MAX(salary) FROM salaries;
+-------------+
| MAX(salary) |
+-------------+
|      158220 |
+-------------+
1 row in set (0.69 sec)
```

### 5. 列の最小値
給与情報(salaries テーブル)から、全データの給与の最小値を取得
```sql
SELECT MIN(salary) FROM salaries;
+-------------+
| MIN(salary) |
+-------------+
|       38623 |
+-------------+
1 row in set (0.62 sec)
```

### 6. 行数
給与情報(salaries テーブル)から、全データの行数を取得
```sql
SELECT COUNT(*) FROM salaries;
+----------+
| COUNT(*) |
+----------+
|  2844047 |
+----------+
1 row in set (0.46 sec)
```

### 7. 絞り込みとの組み合わせ
給与情報(salaries テーブル)から、from_date が1986年6月26日の従業員の最大給与を取得
```sql
SELECT MAX(salary) FROM salaries
WHERE from_date = '1986-06-26';
+-------------+
| MAX(salary) |
+-------------+
|      103344 |
+-------------+
1 row in set (0.68 sec)
```

### 8. 少数第1桁
給与情報(salaries テーブル)から、to_date が1991年6月26日の従業員の平均給与を少数第1桁で取得
```sql
SELECT TRUNCATE(AVG(salary), 1) FROM salaries
WHERE to_date = '1991-06-26';
+--------------------------+
| TRUNCATE(AVG(salary), 1) |
+--------------------------+
|                  57371.5 |
+--------------------------+
1 row in set (0.86 sec)
```
