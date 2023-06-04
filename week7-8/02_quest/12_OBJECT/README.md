## オブジェクト

### 1. 書籍プリンター

書籍の名前と著者名をプロパティとして持つオブジェクトの配列 books を受け取り、「『書籍名』著者名」を出力する関数 printBooks を実装

```js
function printBooks(books) {
  for (let i = 0; i < books.length; i++) {
    console.log("『" + books[i].title + "』" + books[i].author)
  }
}

books = [
  {
    title: "JavaScript入門",
    author: "山田太郎"
  },
  {
    title: "JavaScriptの絵本",
    author: "山田次郎"
  }
]

printBooks(books)
```

### 2. ユーザーパーミッションチェッカー

ユーザー名 username とパーミッションの種類 permission を引数に受け取り、パーミッションが許可されているかどうかを判定する関数 checkPermission を実装  
なお、ユーザーのパーミッションはオブジェクトの配列 users に格納されている  
また、パーミッションの種類には canRead、canWrite、canDelete の 3種類が存在する

### 3. メソッド

JavaScript ではオブジェクトのプロパティが関数である場合、それをメソッドと呼ぶ  
メソッドの定義として正しいものを全て選択する  

1. 

<details opened>

```js
const obj = {
  method: function() {
    console.log('method');
  },
}

obj.method();
```

</details>

2. 

<details open>

```js
const obj = {
  method: () => {
    console.log('method');
  },
}

obj.method();
```

</details>

3. 

  <details open>

  ```js
  const obj = {
    method() {
      console.log('method');
    },
  }

  obj.method();
  ```

  </details>

4.
  <details open>

  ```js
  const obj = {
    () => {
      console.log('method');
    },
  }

  obj.method();
  ```

  </details>
