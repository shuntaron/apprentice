## エンティティ定義

### 1. エンティティの抽出

ユーザーが会員登録し、その後商品を購入できるAmazonのようなECサイトを開発する際にデータとして保存すべきエンティティ(実体)を抽出する  
ECサイトのマイページには、以下の情報が表示される  
表示されている情報がサイトで必要となる全ての種類データであるとする（ユーザーや商品は他にも存在する）  

```html
山田太郎のマイページ

○購入履歴
・購入商品1（4/14購入）
【商品】iPhone 13
【カテゴリー】スマートフォン
【値段】100,000円

・購入商品2（4/17購入）
【商品】キリン一番搾り生ビール10本
【カテゴリー】ビール
【値段】2,000円
```

- ### エンティティ
  - ユーザー
  - 商品
  - カテゴリー
  - 購入商品
