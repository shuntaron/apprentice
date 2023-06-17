## API について

### 1. API とは
API とは、Application Programming Interface の略で、
ソフトウェアやプログラム、 Web サービスの間をつなぐインターフェースを指す  
API を使うことで外部のアプリケーションと機能を連携することができる  
また、ユーザーは API を自身のソフトウェアに簡単に組み込むことができ  
これにより、ソフトウェア開発の手間やコストが削減され、開発の効率化ができる  

### 2. エンドポイントとは
エンドポイントとは、連携したい API にアクセスするための接続先のこと  
この接続先は、 URI と呼ばれ、 URI で表されるエンドポイントにアクセスすることで、  
ユーザーは対象の API へリクエストすることで、自身のソフトウェアと相手のソフトウェアを連携させることができる  

| Name | Full Name                   | Description                           |
| ---- | --------------------------- | ------------------------------------- |
| URI  | Uniform Resource Identifier | Web 上の住所を表す URL と Web 上の名前を表す URN の総称 |
| URL  | Uniform Resource Locator    | Web 上のファイルがどの場所にあるかを示した形式のこと          |
| URN  | Uniform Resource Name       | Web 上のファイルなどを場所ではなく、名前で示した形式のこと       |

### 3. HTTP リクエストと HTTP レスポンスとは
HTTP リクエストはクライアントが Web サーバーへ送信する要求のこと  
HTTP レスポンスは Webサーバー がクライアントへ送信する応答のこと  

https://developer.mozilla.org/ja/docs/Web/HTTP

### 4. HTTP メソッドとは
HTTP メソッドとは、 Web サーバに対しての命令の種類のこと  

| Method | Description           |
| ------ | --------------------- |
| GET    | リソース情報を取得する           |
| POST   | 新しいリソース情報を送り込む        |
| PUT    | リソース情報を新しい情報で置き換える    |
| PATCH  | リソース情報の一部を新しい情報で書き換える |
| DELETE | リソース情報を削除する           |

https://developer.mozilla.org/ja/docs/Web/HTTP/Methods
https://datatracker.ietf.org/doc/html/rfc7231#section-4

| Method  | Description                                                                          |
| ------- | ------------------------------------------------------------------------------------ |
| GET     | Transfer a current representation of the target resource.                            |
| HEAD    | Same as GET, but only transfer the status line and header section.                   |
| POST    | Perform resource-specific processing on the request payload.                         |
| PUT     | Replace all current representations of the target resource with the request payload. |
| DELETE  | Remove all current representations of the target resource.                           |
| CONNECT | Establish a tunnel to the server identified by the target resource.                  |
| OPTIONS | Describe the communication options for the target resource.                          |
| TRACE   | Perform a message loop-back test along the path to the target resource.              |

### 5. JSON
