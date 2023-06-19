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
TODO のデータを保存するためのテーブルを作成する  

テーブル名： todos  
カラム：
- id: タスクの ID
- title: タスクのタイトル
- created_at: タスクの作成日時
- updated_at: タスクの更新日時

```console
$ docker exec -it easy-api-web-1 /bin/bash
$ rails g model Todo title:string
$ rails db:migrate
$ rails db
easy_api_development-# \d todos
                                          Table "public.todos"
   Column   |              Type              | Collation | Nullable |              Default
------------+--------------------------------+-----------+----------+-----------------------------------
 id         | bigint                         |           | not null | nextval('todos_id_seq'::regclass)
 title      | character varying              |           |          |
 created_at | timestamp(6) without time zone |           | not null |
 updated_at | timestamp(6) without time zone |           | not null |
Indexes:
    "todos_pkey" PRIMARY KEY, btree (id)
```

### 3. TODO の追加
TODO を追加するためのエンドポイントを作成する

### エンドポイント
POST /todos

### HTTP リクエストボディ
```js
{
  "todo": {
    "title": "買い物に行く"
  }
}
```

### HTTP レスポンス
```js
{
  "todo": {
    "id": 1,
    "title": "買い物に行く"
  }
}
```

```console
$ docker exec -it easy-api-web-1 /bin/bash
$ rails g controller todos
```

```rb
# config/routes.rb
Rails.application.routes.draw do
  get "/get", to: "application#get"
  post "/todos", to: "todos#create"
end
```

```rb
# app/controllers/todos_controller.rb
class TodosController < ApplicationController
  def create
    todo = Todo.new(todo_params)
    if todo.save
      render json: { todo: todo }, except: [:created_at, :updated_at]
    else
      render json: { error: todo.errors.full_messages }
    end
  end
  
  private
  
  def todo_params
    params.require(:todo).permit(:title)
  end
  
end
```

```console
$ rails routes -c todos
Prefix Verb URI Pattern      Controller#Action
 todos POST /todos(.:format) todos#create
```

```console
$ curl -H "Content-Type: application/json" -X POST -d '
{
  "todo": {
    "title": "買い物に行く"
  }
}
' http://localhost:3000/todos

{
  "todo": {
    "id":1,
    "title":"買い物に行く"
  }
}
```

### 4. TODO の一覧表示
TODO の一覧を表示するためのエンドポイントを作成する

### エンドポイント
GET /todos

### HTTP レスポンス
```js
{
  "todos": [
    {
      "id": 1,
      "title": "買い物に行く"
    },
    {
      "id": 2,
      "title": "掃除をする"
    }
  ]
}
```

```rb
# config/routes.rb
Rails.application.routes.draw do
  get "/get", to: "application#get"
  post "/todos", to: "todos#create"
  get "/todos", to: "todos#index"
end
```

```rb
# app/controllers/todos_controller.rb
class TodosController < ApplicationController
  def index
    todos = Todo.all
    render json: { todos: todos }, except: [:created_at, :updated_at]
  end
end
```

```console
$ rails routes -c todos
Prefix Verb URI Pattern      Controller#Action
 todos POST /todos(.:format) todos#create
       GET  /todos(.:format) todos#index
```

```console
$ curl -s http://localhost:3000/todos
{
  "todos":[
    {
      "id":1,
      "title":"買い物に行く"
    },
    {
      "id":2,
      "title":"掃除をする"
    }
  ]
}
```

### 5. TODO の更新
TODO を更新するためのエンドポイントを作成する
### エンドポイント
PUT /todos/:id

### HTTP リクエストボディ
```js
{
  "todo": {
    "title": "本を買う"
  }
}
```

### HTTP レスポンス
```js
{
  "todo": {
    "id": 1,
    "title": "本を買う"
  }
}
```

```console
$ docker exec -it easy-api-web-1 /bin/bash
$ rails g controller todos
```

```rb
# config/routes.rb
Rails.application.routes.draw do
  get "/get", to: "application#get"
  post "/todos", to: "todos#create"
  get "/todos", to: "todos#index"
  put "/todos/:id", to: "todos#update"
end

```

```rb
# app/controllers/todos_controller.rb
class TodosController < ApplicationController
  def update
    todo = Todo.find(params[:id])
    if todo.update(todo_params)
      render json: { todo: todo }, except: [:created_at, :updated_at]
    else
      render json: { error: todo.errors.full_messages }
    end
  end
  
  private
  
  def todo_params
    params.require(:todo).permit(:title)
  end
  
end
```

```console
curl -H "Content-Type: application/json" -X PUT -d '
{
  "todo": {
    "title": "本を買う"
  }
}
' http://localhost:3000/todos/1

{
  "todo":{
    "id":1,
    "title":"本を買う"
  }
}
```

### 6. TODO の削除
