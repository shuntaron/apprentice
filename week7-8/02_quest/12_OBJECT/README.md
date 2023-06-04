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

```js
function checkPermission(username, permission) {
  let user = users.find(user => user.username === username);
  
  if (user === undefined) {
    console.log(username + ": User not found");
  } else {
    console.log(`checkPermission(${username}, ${permission}): ${user.permissions[permission]}`);
  }
}

let users = [
  {
    username: "山田",
    permissions: {
      canRead: true,
      canWrite: false,
      canDelete: false
    }
  },
  {
    username: "佐藤",
    permissions: {
      canRead: false,
      canWrite: true,
      canDelete: false
    }
  },
  {
    username: "田中",
    permissions: {
      canRead: true,
      canWrite: true,
      canDelete: true
    }
  },
];

checkPermission("山田", "canRead")
checkPermission("山田", "canWrite")
checkPermission("山田", "canDelete")
checkPermission("佐藤", "canRead")
checkPermission("佐藤", "canWrite")
checkPermission("佐藤", "canDelete")
checkPermission("田中", "canRead")
checkPermission("田中", "canWrite")
checkPermission("田中", "canDelete")
```

### 3. メソッド

JavaScript ではオブジェクトのプロパティが関数である場合、それをメソッドと呼ぶ  
メソッドの定義として正しいものを全て選択する  

1: 通常関数（Regular function）  
2: アロー関数（Arrow function）  
3: 通常関数の短縮記法（Method shorthand）  
4: 構文エラー  

1. 通常関数（Regular function）
<details open>

```js
const obj = {
  method: function() {
    console.log('method');
  },
}

obj.method();
```

</details>

2. アロー関数（Arrow function）
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

3. 通常関数の短縮記法（Method shorthand）  
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

4. 構文エラー
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
