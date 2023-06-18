## 簡単な API を作成

TODO を管理できる「TODO アプリ」を作成する  
基本的な機能は以下の通り  

- ### TODO の追加する:  
  - ユーザーは新しいタスクを追加することができる  
  - 各タスクにはタイトル（タスクの簡単な説明）がある  
- ### TODO の一覧を表示する:  
  - ユーザーは、すべてのタスクの一覧示することができる  
  一覧には、タスクのタイトルが表示される
- ### TODO を更新する:  
  - タスクのタイトルを更新することができる
- ### TODO を削除する:  
  - 一覧からタスクを削除することができる

### 1. プロジェクトの作成
### 1.1 アプリケーション作成
```console
$ sed -i -e "s/test-api/easy-api/g" template/Dockerfile template/docker-compose.yml
$ sed -i -e "s/test_api/easy_api/g" template/config/database.yml 
$ cp -rp template easy-api
$ cd easy-api

# アプリケーション作成
$ docker-compose run web rails new . --api --force --database=postgresql
# 以下のエラーメッセージは無視
# Could not find gem '***' in locally installed gems.
# .envファイルの作成
POSTGRES_USERNAME="hoge" # 任意のユーザー名
POSTGRES_PASSWORD="hoge" # 任意のパスワード
# Gemfile に以下追記
# gem "dotenv-rails"
$ sed -i -e "$ s/$/\ngem \"dotenv-rails\"/g" Gemfile
# 新たな Gemfile が作成されたので、イメージを再ビルド
$ docker-compose build
# config/database.yml を修正
# [database.yml](../template/config/database.yml)
# データベースを生成
$ docker-compose run web rails db:create
# アプリ起動
$ docker-compose up
```

### 1-2. エンドポイントの作成
仮のエンドポイント ( GET /get ) を作成する
```rb
# config/routes.rb
Rails.application.routes.draw do
  get "/get", to: "application#get"
end
```

```rb
# app/controllers/application_controller.rb
class ApplicationController < ActionController::API
  def get
    render json: { status: "success" }
  end
end
```

```console
$ docker-compose run web rails routes -c application
Prefix Verb URI Pattern    Controller#Action
   get GET  /get(.:format) application#get
```

```console
$ curl -s http://localhost:3000/get | python3 -mjson.tool
{
    "status": "success"
}
```

### 2. テーブルの作成

### 3. TODO の追加

### 4. TODO の一覧表示

### 5. TODO の更新

### 6. TODO の削除
