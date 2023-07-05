## EC2 上でアプリケーションを動作させる

### 1. WordPress のインストール
- AWS の公式ドキュメント [WordPress ブログをホストする](https://docs.aws.amazon.com/ja_jp/AWSEC2/latest/UserGuide/tuts-wordpress.html) を参考に、WordPress のインストールする
- データベースの接続先はローカルホストではなく、RDS のエンドポイントを指定する

- 以下の変更を行う、それ以外に必要な変更がある場合は、適宜変更する
- MySQL 接続する際に、ホスト名に RDS のエンドポイントを指定する

```bash
[ec2-user ~]$ mysql -u root -h {RDSのエンドポイント} -p
```

- MySQL データベースのユーザーを作成する際に、ホスト名には任意を意味する `%` を指定する

```sql
CREATE USER 'wordpress-user'@'%' IDENTIFIED BY 'your_strong_password';
```

- WordPress ユーザーに権限を付与する際に、ホスト名には `%` を指定する

```sql
GRANT ALL PRIVILEGES ON `wordpress-db`.* TO "wordpress-user"@"%";
```

- `wp-config.php` の `DB_HOST` に RDS のエンドポイントを指定する

```php
define( 'DB_HOST', 'RDSのエンドポイント' );
```

### 2. WordPress へアクセス
