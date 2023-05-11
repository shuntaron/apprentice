## ユーザー作成・権限付与・削除

### 1. ユーザーの作成
```sql
CREATE USER 'test'@'localhost' IDENTIFIED BY 'test';
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
- データベースとテーブルへのフルアクセス権限付与
```sql
-- 権限の確認
mysql> SHOW GRANTS FOR test@localhost;
+------------------------------------------+
| Grants for test@localhost                |
+------------------------------------------+
| GRANT USAGE ON *.* TO `test`@`localhost` |
+------------------------------------------+
1 row in set (0.01 sec)
```

```console
# アクセス権限付与前はデータベースへログイン不可
$ mysql -u test -p
Enter password: 
ERROR 1045 (28000): Access denied for user 'test'@'localhost' (using password: YES)
```

```sql
-- フルアクセス権限の付与
mysql> GRANT ALL PRIVILEGES ON * . * TO 'test'@'localhost';
Query OK, 0 rows affected, 1 warning (0.04 sec)

-- 権限の確認
mysql> SHOW GRANTS FOR test@localhost;
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Grants for test@localhost                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, RELOAD, SHUTDOWN, PROCESS, FILE, REFERENCES, INDEX, ALTER, SHOW DATABASES, SUPER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, CREATE USER, EVENT, TRIGGER, CREATE TABLESPACE, CREATE ROLE, DROP ROLE ON *.* TO `test`@`localhost`                                                                                                                                                                                                                                                                                                                    |
| GRANT APPLICATION_PASSWORD_ADMIN,AUDIT_ABORT_EXEMPT,AUDIT_ADMIN,AUTHENTICATION_POLICY_ADMIN,BACKUP_ADMIN,BINLOG_ADMIN,BINLOG_ENCRYPTION_ADMIN,CLONE_ADMIN,CONNECTION_ADMIN,ENCRYPTION_KEY_ADMIN,FLUSH_OPTIMIZER_COSTS,FLUSH_STATUS,FLUSH_TABLES,FLUSH_USER_RESOURCES,GROUP_REPLICATION_ADMIN,GROUP_REPLICATION_STREAM,INNODB_REDO_LOG_ARCHIVE,INNODB_REDO_LOG_ENABLE,PASSWORDLESS_USER_ADMIN,PERSIST_RO_VARIABLES_ADMIN,REPLICATION_APPLIER,REPLICATION_SLAVE_ADMIN,RESOURCE_GROUP_ADMIN,RESOURCE_GROUP_USER,ROLE_ADMIN,SERVICE_CONNECTION_ADMIN,SESSION_VARIABLES_ADMIN,SET_USER_ID,SHOW_ROUTINE,SYSTEM_USER,SYSTEM_VARIABLES_ADMIN,TABLE_ENCRYPTION_ADMIN,XA_RECOVER_ADMIN ON *.* TO `test`@`localhost` |
| GRANT CREATE ON `mydb`.* TO `test`@`localhost`                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
3 rows in set (0.00 sec)
```

```console
# アクセス権限付与後はデータベースへログイン可
$ mysql -u test -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 14
Server version: 8.0.28 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
```

### 4. 権限のリロード
```sql
mysql> FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.04 sec)
```

### 5. ユーザーの削除
```sql
mysql> DROP USER 'test'@'localhost';
Query OK, 0 rows affected (0.02 sec)

mysql> SELECT USER, HOST FROM mysql.user;
+------------------+-----------+
| USER             | HOST      |
+------------------+-----------+
| root             | %         |
| mysql.infoschema | localhost |
| mysql.session    | localhost |
| mysql.sys        | localhost |
| root             | localhost |
+------------------+-----------+
5 rows in set (0.00 sec)
```

### 6. ユーザーの再作成


