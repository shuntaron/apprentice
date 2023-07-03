## EC2 構築
AWS の公式ドキュメントを参考に、 EC2 を構築する
- [チュートリアル: Amazon EC2 Linux インスタンスの開始方法](https://docs.aws.amazon.com/ja_jp/AWSEC2/latest/UserGuide/EC2_GetStarted.html)

### 1. セキュリティグループの作成
EC2 インスタンス用の VPC セキュリティグループを新規に作成し、外部からの HTTP 通信及び SSH 通信のみを許可する
AWS コンソールからの接続も許可する場合、[Set up EC2 Instance Connect](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-connect-set-up.html) を参考に、AWS の IP アドレスも許可する

### 2. EC2 インスタンスの作成

### 3. EC2 インスタンスに接続
