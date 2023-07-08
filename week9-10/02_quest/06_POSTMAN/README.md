## Postman を使って API をテスト
Postman とは API を開発・テストするためのツールのこと  
API を開発する時には、Postman を使って API の動作確認をすることが多い  

### 1. ファーストリクエスト
[Sending your first request](https://learning.postman.com/docs/getting-started/sending-the-first-request/)
1. ワークベンチで+を選択して、新しいタブを開く
2. リクエストの URL を入力する  
   https://postman-echo.com/get
3. [Send] をクリックする

### 2. 新規プロジェクト
1. ローカルにて API のプロジェクトを作成する  
https://railsdoc.com/page/rails_new
```console
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

2. 以下のエンドポイントを作成する  
```text
GET /get
```

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

3. Postman でリクエストを送信する  
HTTP レスポンスは次のようになる  

```json
{
  "status": "success"
}
```
