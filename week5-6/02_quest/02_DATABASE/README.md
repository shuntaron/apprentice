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


### 3. データベースの作成


### 4. データベースの表示


### 5. データベースの指定


### 6. データベースの削除


### 7. データベースの再作成


