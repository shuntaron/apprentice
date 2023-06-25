## RealWorld

[RealWorld](https://github.com/gothinkster/realworld/tree/main) はブログプラットフォームを作るという OSS のプロジェクトで、実世界と同じ機能を持つプラットフォームを作ることで、学習したいフレームワークの技術を習得することを目的としている

[RealWorld のドキュメント](https://realworld-docs.netlify.app/docs/intro) に目を通した上で、[RealWorld の バックエンドの API](https://realworld-docs.netlify.app/docs/specs/backend-specs/introduction) の仕様を満たす Rails API を作成する

### ステップ1
<details open>

RealWorld の API の仕様を部分的に満たした API を作成する（認証機能のない簡易バージョンの作成を行う）  
RealWorld の API のうち、次のエンドポイントを実装する  
Article に関わる要素のうち、認証機能及び著者、タグ、お気に入り(`favorite`) は実装しない  

- [Create Article](https://realworld-docs.netlify.app/docs/specs/backend-specs/endpoints#create-article)
- [Get Article](https://realworld-docs.netlify.app/docs/specs/backend-specs/endpoints#get-article)
- [Update Article](https://realworld-docs.netlify.app/docs/specs/backend-specs/endpoints#update-article)
- [Delete Article](https://realworld-docs.netlify.app/docs/specs/backend-specs/endpoints#delete-article)

### 1. プロジェクトの作成
```console
$ rails new realworld --api
```

### 2. テーブルの作成
```console
$ rails g model Article title:string description:string body:text
$ rails db:migrate
```

### 3. [Create Article](https://realworld-docs.netlify.app/docs/specs/backend-specs/endpoints#create-article) の実装
```rb
# app/config/routes.rb
Rails.application.routes.draw do
  namespace :api do
    resources :articles, only: [:index, :show, :create, :update, :destroy]
  end
end
```

```console
$ rails g controller api/articles
# -> アクションの設定
$ curl -H "Content-Type: application/json" -X POST -d '
{
  "title": "How to train your dragon",
  "description": "Ever wonder how?",
  "body": "You have to believe"
}
' http://localhost:3000/api/articles
```

```rb
# app/controllers/api/articles_controller.rb
def create
  article = Article.new(article_params)
  if article.save
    render json: { status: 'SUCCESS', data: article }
  else
    render json: { status: 'ERROR', data: article.errors }
  end
end
```

### 4. [Get Article](https://realworld-docs.netlify.app/docs/specs/backend-specs/endpoints#get-article) の実装
```rb
# app/controllers/api/articles_controller.rb
def show
  article = Article.find(params[:id])
  render json: { status: 'SUCCESS', data: article }
end
```

```console
$ curl -s http://localhost:3000/api/articles/1 | python -mjson.tool
```

### 5. [Update Article](https://realworld-docs.netlify.app/docs/specs/backend-specs/endpoints#update-article) の実装

```rb
# app/controllers/api/articles_controller.rb
def update
  article = Article.find(params[:id])
  if article.update(article_params)
    render json: { status: 'SUCCESS', data: article }
  else
    render json: { status: 'ERROR', data: article.errors }
  end
end
```

```console
$ curl -H "Content-Type: application/json" -X PUT -d '
{
  "article": {
    "title": "Did you train your dragon?"
  }
}
' http://localhost:3000/api/articles/1
```

### 6. [Delete Article](https://realworld-docs.netlify.app/docs/specs/backend-specs/endpoints#delete-article) の実装

```rb
# app/controllers/api/articles_controller.rb
def destroy
  article = Article.find(params[:id])
  article.destroy
  render json: { status: 'SUCCESS', data: article }
end
```

```console
$ curl -H "Content-Type: application/json" -X DELETE http://localhost:3000/api/articles/1
```

</details>
