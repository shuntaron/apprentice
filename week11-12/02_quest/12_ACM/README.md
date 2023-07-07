## ACM で SSL 化

AWS の公式ドキュメントを参考に AWS Certificate Manager (ACM) を利用して、SSL 化 (HTTPS 化) を行う  
また、HTTP 通信を HTTPS 通信にリダイレクトさせる

SSL 化には色々な方法があるが、今回は ACM と Elastic Load Balancing (ELB) を利用する

- [パブリック証明書をリクエストする](https://docs.aws.amazon.com/ja_jp/acm/latest/userguide/gs-acm-request-public.html)
- [Application Load Balancer の開始方法](https://docs.aws.amazon.com/ja_jp/elasticloadbalancing/latest/application/application-load-balancer-getting-started.html)
- [Application Load Balancer 用の HTTPS リスナーを作成する](https://docs.aws.amazon.com/ja_jp/elasticloadbalancing/latest/application/create-https-listener.html)
- [ELB ロードバランサーへのトラフィックのルーティング](https://docs.aws.amazon.com/ja_jp/Route53/latest/DeveloperGuide/routing-to-elb-load-balancer.html)
- [Application Load Balancer を使用して HTTP リクエストを HTTPS にリダイレクトするにはどうすればよいですか?](https://repost.aws/ja/knowledge-center/elb-redirect-http-to-https-using-alb)

### 1. パブリック証明書のリクエスト
- ACM を利用して、取得したドメインに対してパブリック証明書をリクエストする
- その際に、検証を成功させ、証明書のステータスが Issued (発行済み) になるようにする

### 2. ELB のターゲットグループの作成
- ロードバランシングのターゲットグループを新規作成する
- 作成した VPC 及び EC2 を選択する

### 3. ELB のロードバランサーの作成

### 4. ELB の HTTPS リスナーの追加

### 5. セキュリティグループで HTTPS 通信を許可

### 6. 独自ドメインを HTTPS 通信に対応

### 7. HTTP 通信を HTTPS 通信にリダイレクト
