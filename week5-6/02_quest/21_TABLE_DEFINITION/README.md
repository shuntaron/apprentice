## テーブル定義

テーブル定義では各テーブルに対して
- テーブル名
- カラム名
- データ型
- NULL(NULL OK の場合のみ YES と記載)
- キー（キーが存在する場合、PRIMARY/INDEX のどちらかを記載）
- 初期値（ある場合のみ記載）
- AUTO INCREMENT（ある場合のみ YES と記載）
- 外部キー制約
- ユニークキー制約
を定義する

### 1. データ型
「データ型」とは、「データの種類」のこと  
データベースでは、テーブル作成時に指定した種類のデータしか入力できないようカラムに対してデータ型を設定する  
データ型には「整数型」「文字列型」「日付型」などいくつかの種類があり、それぞれのカラムごとに、あらかじめ1つずつ設定しておく必要がある  

### 2. NULL
「NULL」とは、テーブルのカラムの中に何もデータが入っていないこと  

### 3. プライマリーキー
「プライマリーキー」とは、テーブルの行（レコード）を一意に特定するための項目（カラム）のこと  
テーブルにおいて必ず1つ存在しなければならず、かつ1つしか存在しない  

### 4. 初期値
「初期値」とは、テーブルへのデータ追加時に、値が設定されていなかった場合に設定されるデフォルト値のこと  

### 5. AUTO INCREMENT
「AUTO INCREMENT」とは、指定したカラムに対して自動的に一意のシーケンス番号を生成する機能のこと  

### 6. 外部キー制約
「外部キー制約」とは、指定したカラムに対して他のテーブルの特定の列の値しか指定できないようにするもの

### 7. ユニークキー制約
「ユニークキー制約」とは、データ追加、更新時に、その列の中でデータが一意（他と重複しない）でなければならないという制約  

### 8. テーブル定義
EC サイトの ER 図を、テーブル定義する  

### アウトプット例
テーブル： users
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|bigint(20)||PRIMARY||YES|
|name|varchar(100)|||||
|email|varchar(100)||INDEX|||

- ユニークキー制約：email カラムに対して設定

テーブル： comments
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|id|bigint(20)||PRIMARY||YES|
|user_id|bigint(20)|YES|INDEX|0||
|content|text|||||

- 外部キー制約： user_id に対して、 users テーブルの id カラムから設定

### 解答

### [購入テーブル]
テーブル： purchases
| COLUMN        | DATA TYPE  | NULL | KEY     | DEFAULT | AUTO INCREMENT |
| ------------- | ---------- | ---- | ------- | ------- | -------------- |
| id            | bigint(20) |      | PRIMARY |         | YES            |
| purchase_date | date       |      |         |         |                |
| user_id       | int(11)    | YES  |         |         |                |

- 外部キー制約： user_id に対して、 users テーブルの id カラムから設定

### [ユーザーテーブル]
テーブル名： users
| COLUMN | DATA TYPE    | NULL | KEY     | DEFAULT | AUTO INCREMENT |
| ------ | ------------ | ---- | ------- | ------- | -------------- |
| id     | bigint(20)   |      | PRIMARY |         | YES            |
| name   | varchar(255) |      |         |         |                |


### [購入商品テーブル]
テーブル名： purchase_products
| COLUMN      | DATA TYPE  | NULL | KEY     | DEFAULT | AUTO INCREMENT |
| ----------- | ---------- | ---- | ------- | ------- | -------------- |
| id          | bigint(20) |      | PRIMARY |         | YES            |
| purchase_id | int(11)    | YES  |         |         |                |
| product_id  | int(11)    | YES  |         |         |                |

- 外部キー制約： purchase_id に対して、 purchases テーブルの id カラムから設定
- 外部キー制約： product_id に対して、 products テーブルの id カラムから設定

### [商品テーブル]
テーブル名： products
| COLUMN      | DATA TYPE  | NULL | KEY     | DEFAULT | AUTO INCREMENT |
| ----------- | ---------- | ---- | ------- | ------- | -------------- |
| id          | bigint(20) |      | PRIMARY |         | YES            |
| name        | date       |      |         |         |                |
| price       | int(11)    |      |         |         |                |
| category_id | int(11)    | YES  |         |         |                |

- 外部キー制約： category_id に対して、 category テーブルの id カラムから設定

### [カテゴリーテーブル]
テーブル名： categories
| COLUMN | DATA TYPE    | NULL | KEY     | DEFAULT | AUTO INCREMENT |
| ------ | ------------ | ---- | ------- | ------- | -------------- |
| id     | bigint(20)   |      | PRIMARY |         | YES            |
| name   | varchar(255) |      |         |         |                |
