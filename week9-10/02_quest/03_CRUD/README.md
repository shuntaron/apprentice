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

# 新たな Gemfile が作成されたので、イメージを再ビルド
$ docker-compose build

# アプリ起動
$ docker-compose up
```

### 2. テーブルの作成

### 3. モデルの作成

### 4. ルーティングの設定

### 5. コントローラーの作成

### 6. ビューの作成

### 7. TODO 新規作成ページの作成

### 8. TODO 一覧の表示

### 9. 編集ページの作成

### 10. 削除機能