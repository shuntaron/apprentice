## HTTP について

### 1. HTTP とは
HTTP とは、 HyperText Transfer Protocol の略で、Web サーバと Web ブラウザの間でデータの送受信を行うために用いられるプロトコル(通信規約)のこと

### 2. プロトコルとは
プロトコル(Protocol)とは、コンピューター同士が通信をする際の手順や規格のこと

### 3. HTTP リクエスト
HTTP リクエストはクライアントが Web サーバーへ送信する要求のこと  
リクエストライン、メッセージヘッダ、メッセージボディの3つの要素から構成されている  

### HTTP リクエストの構成
https://developer.mozilla.org/ja/docs/Web/HTTP/Messages
https://developer.mozilla.org/ja/docs/Web/HTTP/Headers

| Element  | Description                                                              |
| -------- | ------------------------------------------------------------------------ |
| リクエストライン | HTTP メソッド、リクエスト先 URL 、HTTP バージョンで構成されている  <br>`GET /index.html HTTP/1.1` |
| メッセージヘッダ | 通信制御やデータ出力制御などに利用する情報で構成されている                                            |
| メッセージボディ | クライアントからサーバーへ送信するコンテンツのこと                                            |


### HTTP メソッド
HTTP メソッドとは、 Web サーバに対しての命令の種類のこと  

| Method | Description           |
| ------ | --------------------- |
| GET    | リソース情報を取得する           |
| POST   | 新しいリソース情報を送り込む        |
| PUT    | リソース情報を新しい情報で置き換える    |
| PATCH  | リソース情報の一部を新しい情報で書き換える |
| DELETE | リソース情報を削除する           |

https://developer.mozilla.org/ja/docs/Web/HTTP/Methods

### 4. HTTP レスポンス
HTTP レスポンスは Webサーバー がクライアントへ送信する応答のこと  
HTTP レスポンスはステータスライン、メッセージヘッダ、メッセージボディの3つの要素から構成されている  

### HTTP レスポンスの構成
https://developer.mozilla.org/ja/docs/Web/HTTP

| Element  | Description                                                          |
| -------- | -------------------------------------------------------------------- |
| ステータスライン | HTTP バージョン、ステータスコード 、ステータス文字列で構成されている  <br>`HTTP/1.1 404 Not Found.` |
| メッセージヘッダ | 通信制御やデータ出力制御などに利用する情報で構成されている                                        |
| メッセージボディ | サーバーからクライアントへ返却するコンテンツのこと                                            |


### 5. HTTP 通信
https://www.google.com/ にブラウザでアクセスすると Google のトップページが開かれる  
それはどのようなリクエストが行われ、どのようなレスポンスが返されているのか  

1. リクエスト

ブラウザは以下のような HTTP リクエストをサーバへ送信する
```text
GET / HTTP/1.1
Host: www.google.com
```

2. レスポンス

サーバはリクエストを受け取り、以下のような HTTP レスポンスをブラウザへ返却する  

```text
HTTP/1.1 200 OK
Content-Type: text/html; charset=UTF-8
...

<!DOCTYPE html>
<html>
  <head>
    <title>Google</title>
    ...
  </head>
  <body>
    ...
  </body>
</html>
```
