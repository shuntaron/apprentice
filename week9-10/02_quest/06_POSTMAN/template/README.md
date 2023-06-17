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

### 3. 実行される SQL クエリの確認

### 4. 特定のデータの取得

### 5. バリデーション
