## データ登録・検索・更新・削除

### 1. データの登録
```sql
INSERT INTO footballers (
  id, 
  name
) 
VALUES (
  1, 
  'Lionel Messi'
);
Query OK, 1 row affected (0.02 sec)
```

### 2. データの検索
```sql
mysql> SELECT * FROM footballers;
+------+--------------+
| id   | name         |
+------+--------------+
|    1 | Lionel Messi |
+------+--------------+
1 row in set (0.00 sec)
```

### 3. データの更新
```sql
UPDATE footballers 
SET 
  id = 2,
  name = 'Cristiano Ronaldo' 
WHERE 
  id = 2
;
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM footballers;
+------+-------------------+
| id   | name              |
+------+-------------------+
|    2 | Cristiano Ronaldo |
+------+-------------------+
1 row in set (0.00 sec)
```

### 4. データの削除
```sql
DELETE FROM footballers
-- WHERE id = 2
;
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM footballers;
Empty set (0.00 sec)
```
