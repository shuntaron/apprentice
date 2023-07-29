## JavaScript

### 1. JavaScript とは
JavaScript はウェブページにて複雑な機能をできるようにするプログラミング言語のこと  
HTMLはウェブページの構造を定義し、CSSは見た目を装飾する役割を担っていますが、JavaScript を使うことで HTML と CSS を動的に操作することできる

https://developer.mozilla.org/ja/docs/Learn/JavaScript/First_steps
https://developer.mozilla.org/ja/docs/Learn/JavaScript/First_steps/What_is_JavaScript
https://developer.mozilla.org/ja/docs/Web/JavaScript

### 2. ECMAScript とは
ECMAScript は JavaScript のベースとなっているスクリプト言語仕様のこと  
ECMAScript は改定が行われるたびにバージョンが新しくなるが、 JavaScript そのものに現在バージョンは存在しない  

https://developer.mozilla.org/ja/docs/Glossary/ECMAScript

### 3. 環境構築

1. hello.html を作成

```html
<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>JavaScript学習</title>
</head>

<body>
  <script src="hello.js"></script>
</body>

</html>
```

2. hello.js を作成
```javascript
console.log('Hello World');
```

3. hello.html をブラウザで開く

- VS Code 拡張機能  
[Live Server](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer) (https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer)  
コードに変更が発生した際にブラウザを自動的に更新してくれる拡張機能  
