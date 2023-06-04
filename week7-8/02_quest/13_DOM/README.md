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

### 2. 要素ノードの変更

### 3. イベントハンドラの設定

### 4. 要素ノードの追加

### 5. 要素ノードの追加

### 6. スタイルの変更

### 7. 要素ノードの削除
