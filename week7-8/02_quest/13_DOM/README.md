## DOM 操作
以下、ブログの投稿フォームを作成するための HTML について  
`dom.js` に JavaScript を記載し、DOM 操作を行う  

```html
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ブログ</title>
</head>
<body>
  <h1>ブログ</h1>
  <form id="post-form">
    <label for="title">タイトル：</label><br>
    <input type="text" id="title" name="title"><br>
    <label for="content">本文：</label><br>
    <textarea id="content" name="content"></textarea><br>
    <input type="submit" value="Submit">
  </form>
  <div id="posts"></div>
  <script src="dom.js"></script>
</body>
</html>
```

### 1. DOM とは
DOM とは Document Object Model の略で HTML のような文書の構造をメモリー内に表現することで、ウェブページとスクリプトやプログラミング言語を接続するもの  
以前は W3C によって標準化が行われていたが、現在は WHATWG によって標準化が行われている  

DOM は文書を論理的なツリーで表現し、ツリーのそれぞれの枝はノードで終わっており、それぞれのノードがオブジェクトを含んでいる  
DOM のメソッドでプログラム的にツリーにアクセスすることができ、  
これにより、文書構造やスタイルやコンテンツを変更することができる  

DOM にアクセスするために DOM API がある  
DOM APIは、Webブラウザが提供するAPIの一部であり、DOMにアクセスするための機能を提供する  

API とは、Application Programming Interface の略で、ソフトウェアやプログラム、Webサービスの間をつなぐインターフェースを指し、API を使うことで外部のアプリケーションと機能を共有することができる  

https://developer.mozilla.org/ja/docs/Web/API/Document_Object_Model

https://developer.mozilla.org/ja/docs/Web/API/Document_Object_Model/Introduction

### 2. 要素ノードの変更
JavaScript を使って、h1 タグのテキストを「シンプルブログ」へ変更する

```js
document.querySelector("body > h1").innerHTML = "シンプルブログ"
```

### 3. イベントハンドラの設定
JavaScript を使って、フォームの送信ボタンをクリックしたときに、フォームに入力された内容（タイトルと本文）をコンソールに出力する

```js
// ページ読み込み時のイベントハンドラを登録
window.addEventListener('DOMContentLoaded', function() {

  // formの要素を取得
  const form = document.getElementById("post-form");
  
  // formのsubmitイベントのイベントハンドラを登録
  form.addEventListener("submit", function(e) {
    // EventオブジェクトのpreventDefaultメソッドをキャンセルし、フォーム送信を無効化
    e.preventDefault();
    
    // タイトルと本文の値を取得
    let title = document.getElementById("title").value;
    let content = document.getElementById("content").value;
    
    // タイトルと本文の値をコンソールに出力
    console.log(`タイトル： ${title}`);
    console.log(`本文： ${content}`);
  });
});
```

### 4. 要素ノードの追加
JavaScript を使って、フォームの送信ボタンをクリックしたときに、フォームの内容を `#posts` の div タグ内に、以下の形式で表示する

```html
<div id="posts">
  <h2>入力されたタイトル</h2>
  <p>入力された本文</p>
</div>
```

```js
// ページ読み込み時のイベントハンドラを登録
window.addEventListener('DOMContentLoaded', function() {

  // formの要素を取得
  const form = document.getElementById("post-form");

  // #postsの要素を取得し、変数postsに代入
  const posts = document.getElementById("posts");
  
  // formのsubmitイベントのイベントハンドラを登録
  form.addEventListener("submit", function(e) {
    // EventオブジェクトのpreventDefaultメソッドをキャンセルし、フォーム送信を無効化
    e.preventDefault();
  
    // タイトルと本文の値を取得
    let title = document.getElementById("title").value;
    let content = document.getElementById("content").value;
    
    // タイトルと本文の値をコンソールに出力
    console.log(`タイトル： ${title}`);
    console.log(`本文： ${content}`);
    
    // タイトルと本文の値を#postsの要素に追加
    posts.innerHTML = `
        <h2>${title}</h2>
        <p>${content}</p>
    `;
  });
});
```

### 5. 要素ノードの追加
JavaScript を使って、フォームの送信ボタンをクリックしたときに、フォームの中身を空にする  

```js
// タイトルと本文の値を空文字にする
document.getElementById("title").value = "";
document.getElementById("content").value = "";

// タイトルと本文の値を空文字にする（他の方法）
// フォームの値をリセット
// form.reset();
```

### 6. スタイルの変更
JavaScript を使って、`#posts` の div タグ上にマウスポインターを乗せたタイミングで背景色を黄色に、マウスポインターを外したタイミングで白色に変更する

```js
// #postsの要素を取得し、変数postsに代入
const posts = document.getElementById("posts");

// #postsの要素にマウスが乗った時のイベントハンドラを登録
posts.addEventListener("mouseover", function() {
  this.style.backgroundColor = "yellow";
});
posts.addEventListener("mouseout", function() {
  this.style.backgroundColor = "white";
});
```

### 7. 要素ノードの削除
