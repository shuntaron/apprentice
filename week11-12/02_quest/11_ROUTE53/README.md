## Route53 でドメインを設定
AWS の公式ドキュメントを参考に、ドメインを設定する

- [新しいドメインの登録](https://docs.aws.amazon.com/ja_jp/Route53/latest/DeveloperGuide/domain-register.html)
- [Amazon EC2 インスタンスへのトラフィックのルーティング](https://docs.aws.amazon.com/ja_jp/Route53/latest/DeveloperGuide/routing-to-ec2-instance.html)

### 1. ドメインの登録
- ドメインを取得する

### 2. ホストゾーン及びレコードの作成
- Route 53 のホストゾーンを新規に作成する  
\*Route 53 からドメインを取得した場合、ホストゾーンは自動的に作成される
- 作成したホストゾーン内で、レコードを新規作成する
- レコードは以下のように設定する

|項目|値|
|---|---|
|タイプ| A レコード|
|ルーティングポリシー| シンプルルーティング|
|IPアドレス| EC2 インスタンスのパブリック IP アドレス|

### 3. ドメイン名でアクセス
