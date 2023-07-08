## 単体テスト
「TODO アプリ」を対象に単体テストコードを作成する

### 1. 単体テスト
TODO モデルに対するテストコードを作成する
以下をテストコードで確認する  

- TODO タスクのタイトルが空だった場合、バリデーションエラーになる
- TODO タスクのタイトルが入力されていた場合、バリデーションエラーにならない

```console
$ docker exec -it unit-test-api-web-1 /bin/bash
$ rails test test/models/todo_test.rb
Run options: --seed 46640

# Running:

..

Finished in 0.098729s, 20.2574 runs/s, 40.5149 assertions/s.
2 runs, 4 assertions, 0 failures, 0 errors, 0 skips
```
