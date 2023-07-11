## RealWorld のデプロイ
RealWorld のバックエンド API を AWS 上にデプロイする

### ステップ1
RealWorld のバックエンドの API を AWS 上にデプロイする  

### 要件
- 各エンドポイントに対してリクエストを送ると、正しいレスポンスが返ってくること
- API サーバー (EC2 もしくは ECS) とデータベースサーバー (RDS) は別々に構築すること
- データベースサーバーは、API サーバーからのみアクセスできるようにすること
- 独自ドメインでアクセスできるようにすること
- SSL 化 (HTTPS 化) すること

### ステップ2
インフラ構成図 (AWS のアーキテクチャ図) を作成する

### 参考
[AWS のアーキテクチャ図を描きたい ! でもどうすれば良いの ?](https://aws.amazon.com/jp/builders-flash/202204/way-to-draw-architecture/?awsf.filter-name=*all)
