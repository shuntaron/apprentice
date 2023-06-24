## 結合テスト
「TODO アプリ」を対象に結合テストコードを作成する

### 1. 結合テスト
以下の HTTP リクエストに対するテストコードを作成する

- `GET /todos` された場合、レスポンスとして HTTP ステータスコード200が返ってくる
- `POST /todos` された場合、リダイレクトされる（レスポンスとして HTTP ステータスコード302が返ってくる でも可）

```console
$ docker exec -it integration-test-api-web-1 /bin/bash
$ rails test test/controllers/todos_controller_test.rb
Run options: --seed 13500

# Running:

..

Finished in 2.011869s, 0.9941 runs/s, 1.4912 assertions/s.
2 runs, 3 assertions, 0 failures, 0 errors, 0 skips
```

