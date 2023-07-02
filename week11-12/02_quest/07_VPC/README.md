## VPC 構築
AWS の公式ドキュメントを参考に、 VPC を構築する
- [Amazon VPC の使用を開始する](https://docs.aws.amazon.com/ja_jp/vpc/latest/userguide/vpc-getting-started.html)
- [チュートリアル: DB インスタンスで使用する VPC を作成する](https://docs.aws.amazon.com/ja_jp/AmazonRDS/latest/UserGuide/CHAP_Tutorials.WebServerDB.CreateVPC.html)

### 1. VPC の作成
VPC を新規作成する

### 2. サブネットの作成
作成した VPC 内に、2つのパブリックサブネットと、2つのプライベートサブネットを構築する  
パブリックサブネット及びプライベートサブネットは、2つをそれぞれ異なるアベイラビリティーゾーンに配置する  

### 3. インターネットゲートウェイの作成
インターネットゲートウェイを新規に作成し、作成した VPC にアタッチする

### 4. ルートテーブル
パブリックサブネット用のルートテーブルを作成する  
ルートテーブルのターゲットにて、デフォルトルート（0.0.0.0/0。ルートテーブルのどのアドレスにも一致しない経路）をインターネットゲートウェイに設定する