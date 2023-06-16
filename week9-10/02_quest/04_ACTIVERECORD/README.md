## ActiveRecord

### 1. ActiveRecord とは
ActiveRecord とは、 MVC の中の Model に相当するもの  
Model は、データベースとデータのやり取りを処理するもの  
ActiveRecord を使うことで、以下のようなメリットがある  
- Ruby で直感的にデータを処理できる
- DB の種類に書き方を統一できる

ActiveRecord は、ORM（オブジェクト/リレーショナルマッピング）システムに記述されている「ActiveRecordパターン」を実装したものであり、このパターンと同じ名前が付けられている  
パターン名としてのActive RecordはMartin Fowler『Patterns of Enterprise Application Architecture』という書籍に記述されている  
Active Recordパターンは、データアクセスのロジックを常にオブジェクトに含めておくことで、そのオブジェクトの利用者にデータベースへの読み書き方法を指示できる、という立場に立っている  

https://railsguides.jp/active_record_basics.html#active-recordについて

### 2. 全データの取得
Rails のコンソールを立ち上げ、 Todo モデルの全データを取得する  

```console
# Docker コンテナ起動
$ docker-compose start
# Rails コンソール起動
$ docker-compose run web rails console
```

```irb
irb(main):001:0> Todo.all
  Todo Load (0.4ms)  SELECT "todos".* FROM "todos"
=>
[#<Todo:0x00007f83c4994db0
  id: 1,
  title: "hoge1",
  created_at: Fri, 16 Jun 2023 13:03:37.506262000 UTC +00:00,
  updated_at: Fri, 16 Jun 2023 13:03:37.506262000 UTC +00:00>,
 #<Todo:0x00007f83c4953d60
  id: 2,
  title: "hoge2",
  created_at: Fri, 16 Jun 2023 13:05:49.338251000 UTC +00:00,
  updated_at: Fri, 16 Jun 2023 13:05:49.338251000 UTC +00:00>]
```

### 3. 実行される SQL クエリの確認
全データの取得をする際に実行される SQL クエリを確認する  


```irb
irb(main):001:0> Todo.all.to_sql
=> "SELECT \"todos\".* FROM \"todos\""
```

### 4. 特定のデータの取得

### 5. バリデーション
