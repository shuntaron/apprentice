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


### 4. データの削除

