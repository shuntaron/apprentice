## データベースの作成・指定・削除

### 1. データベースのインストール

1. docker-compose.yml ファイルの作成
```yml
services:
  mysql:
    image: mysql:8.0.28
    platform: linux/amd64
    container_name: mysql-container
    ports:
      - "3306:3306"
    environment:
      MYSQL_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD}
      MYSQL_DATABASE: ${MYSQL_DATABASE}
      TZ: "Asia/Tokyo"
    volumes:
      - ./my.cnf:/etc/mysql/conf.d/my.cnf
```

2. .envファイルへ任意の環境変数を設定
```env
MYSQL_ROOT_PASSWORD: ****
MYSQL_DATABASE: ****
```

```console
# docker-compose.yml の実際のパラメータを確認
$ docker-compose config
```

3. my.cnf ファイルの作成
```cnf
[mysqld]
character-set-server = utf8mb4
collation-server = utf8mb4_bin

[mysql]
default-character-set = utf8mb4

[client]
default-character-set = utf8mb4
```

4. MySQLコンテナの作成
```console
# docker-composeでコンテナを起動
$ docker-compose up -d

# コンテナイメージ一覧確認
$ docker images

# 実行中のコンテナ一覧確認
$ docker ps

# コンテナにログイン
$ docker exec -it mysql-container bash

# MySQLのバージョン確認
$ mysql --version
mysql  Ver 8.0.28 for Linux on x86_64 (MySQL Community Server - GPL)
```

### 2. データベースへの接続
```
# MySQLコンテナの起動
$ docker start mysql-container

# コンテナにログイン
$ docker exec -it mysql-container bash

# MySQLへ接続
$ mysql -u root -p
```

### 3. データベースの作成
```sql
mysql> CREATE DATABASE test;
Query OK, 1 row affected (0.01 sec)
```

### 4. データベースの表示
```sql
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| test               |
| test_database      |
+--------------------+
6 rows in set (0.00 sec)

```

### 5. データベースの指定
```sql
mysql> select database();
+------------+
| database() |
+------------+
| NULL       |
+------------+
1 row in set (0.00 sec)

mysql> use test
Database changed
mysql> select database();
+------------+
| database() |
+------------+
| test       |
+------------+
1 row in set (0.00 sec)
```

### 6. データベースの削除


### 7. データベースの再作成


