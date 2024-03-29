## RDS 構築
AWS の公式ドキュメントを参考に、 RDS を構築する

- [VPC 内の DB インスタンスの使用](https://docs.aws.amazon.com/ja_jp/AmazonRDS/latest/UserGuide/USER_VPC.WorkingWithRDSInstanceinaVPC.html)
- [DB インスタンスを作成する](https://docs.aws.amazon.com/ja_jp/AmazonRDS/latest/UserGuide/CHAP_Tutorials.WebServerDB.CreateDBInstance.html)

### 1. セキュリティグループの作成
- データベース用の VPC セキュリティグループを作成する
- 外部からの MySQL 通信のみを許可する

### 2. RDS のサブネットグループ
- RDS のサブネットグループを作成する
- 作成した VPC を選択する
- 作成した2つのプライベートサブネットを割り当てる

### 3. RDS の作成
- RDS を新規作成する
- エンジンのタイプは MySQL を選択する
- デプロイオプションは「単一の DB インスタンス」を指定する マルチ AZ は無効にする  
- VPC 及び DB サブネットグループ、VPC セキュリティグループは作成したものを選択する
- パブリックアクセスは無効化する
