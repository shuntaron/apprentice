## 結合テスト
「TODO アプリ」を対象に結合テストコードを作成する

### 1. 結合テスト
以下の HTTP リクエストに対するテストコードを作成する

- `GET /todos` された場合、レスポンスとして HTTP ステータスコード200が返ってくる
- `POST /todos` された場合、リダイレクトされる（レスポンスとして HTTP ステータスコード302が返ってくる でも可）

```rb
# test/controllers/todos_controller_test.rb
require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  # GET /todos された場合、レスポンスとして HTTP ステータスコード200が返ってくる
  test "GET /todos returns HTTP status code 200" do
    get todos_url
    assert_response 200
  end
  
  # POST /todos された場合、リダイレクトされる
  # HTTP ステータスコード302が返ってくる でも可
  test "POST /todos redirects" do
    post todos_url, params: { todo: { title: "test" } }
    assert_response :redirect
    assert_response 302
  end
end
```

```console
$ docker exec -it integration-test-api-web-1 /bin/bash
$ rails test test/controllers/todos_controller_test.rb
Run options: --seed 13500

# Running:

..

Finished in 2.011869s, 0.9941 runs/s, 1.4912 assertions/s.
2 runs, 3 assertions, 0 failures, 0 errors, 0 skips
```

