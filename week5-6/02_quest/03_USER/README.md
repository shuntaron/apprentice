## ユーザー作成・権限付与・削除

### 1. ユーザーの作成
```sql
CREATE USER 'test'@'localhost' IDENTIFIED BY 'password';
```

### 2. ユーザーの表示
```sql
mysql> SELECT USER, HOST FROM mysql.user;
+------------------+-----------+
| USER             | HOST      |
+------------------+-----------+
| root             | %         |
| mysql.infoschema | localhost |
| mysql.session    | localhost |
| mysql.sys        | localhost |
| root             | localhost |
| test             | localhost |
+------------------+-----------+
6 rows in set (0.00 sec)
```

### 3. ユーザーへの権限付与


### 4. 権限のリロード


### 5. ユーザーの削除


### 6. ユーザーの再作成


