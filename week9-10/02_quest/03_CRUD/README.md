## CRUD 処理の実装
TODO を管理できる「TODO アプリ」を作成する  
Scaffold 機能は使用しない

### 基本機能
- TODO を追加する:
  - ユーザーは新しいタスクを追加することができる  
  - 各タスクにはタイトル（タスクの簡単な説明）がある  
- TODO の一覧を表示する:
  - ユーザーは、すべてのタスクの一覧示することができる  
  - 一覧には、タスクのタイトルが表示される
- TODO を編集する:
  - タスクのタイトルを編集することができる
- TODO を削除する:
  - 一覧からタスクを削除することができる

### 1. プロジェクトの作成
Rails の新規プロジェクトを作成する  
トップページにアクセスしたときに、ページが表示されることを確認する  
https://docs.docker.jp/compose/rails.html

```console
# プロジェクトのビルド
$ docker-compose run web rails new . --force --database=postgresql

# Gemfile に以下追記
gem "dotenv-rails"

# 新たな Gemfile が作成されたので、イメージを再ビルド
$ docker-compose build

# config/database.yml を修正
# [database.yml](./template/config/database.yml)

# データベースを生成
$ docker-compose run web rails db:create

# アプリ起動
$ docker-compose up
```

### 2. テーブルの作成
テーブルを作成する  
テーブルの作成にはマイグレーションを使用する  
マイグレーションを使用すると以下のようなメリットがある  
- SQL文を書かずにデータベースの構造を変更できる
- migration ファイルを共有することで、複数の開発環境でデータベースの構造を簡単に共有できる
- bin/rails db:migrate:status コマンドで、 migration ファイルの適用状況を確認できる
- bin/rails db:rollback コマンドで、データベース構造を少し前の状態に戻せる

### [todos テーブル]
テーブル名： todos
| カラム        | 内容       |
| ---------- | -------- |
| id         | タスクの ID  |
| title      | タスクのタイトル |
| created_at | タスクの作成日時 |
| updated_at | タスクの更新日時 |

```console
# モデルの作成
$ docker-compose run web rails g model Todo title:string

# マイグレーションの実行
$ docker-compose run web rails db:migrate
```

### 3. モデルの作成
TODO のデータを扱うためのモデルを作成する

```console
# モデルの作成（2. で実行済）
$ docker-compose run web rails g model Todo title:string
```

### 4. ルーティングの設定

### 5. コントローラーの作成

### 6. ビューの作成

### 7. TODO 新規作成ページの作成

### 8. TODO 一覧の表示

### 9. 編集ページの作成

### 10. 削除機能
