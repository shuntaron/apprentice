## RealWorld

[RealWorld](https://github.com/gothinkster/realworld/tree/main) はブログプラットフォームを作るという OSS のプロジェクトで、実世界と同じ機能を持つプラットフォームを作ることで、学習したいフレームワークの技術を習得することを目的としている

[RealWorld のドキュメント](https://realworld-docs.netlify.app/docs/intro) に目を通した上で、[RealWorld の バックエンドの API](https://realworld-docs.netlify.app/docs/specs/backend-specs/introduction) の仕様を満たす Rails API を作成する

### ステップ1
ステップ1 では RealWorld の API の仕様を部分的に満たした API を作成する  
認証機能のない簡易バージョンの作成を行う  
RealWorld　の API のうち、次のエンドポイントを実装する  
なお、Article に関わる要素のうち、認証機能及び著者、タグ、お気に入り(`favorite`) は実装しない  

- [Create Article](https://realworld-docs.netlify.app/docs/specs/backend-specs/endpoints#create-article)
- [Get Article](https://realworld-docs.netlify.app/docs/specs/backend-specs/endpoints#get-article)
- [Update Article](https://realworld-docs.netlify.app/docs/specs/backend-specs/endpoints#update-article)
- [Delete Article](https://realworld-docs.netlify.app/docs/specs/backend-specs/endpoints#delete-article)

1. プロジェクトの作成
```console
rails new realworld --api
```
