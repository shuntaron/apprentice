## ループ

### 1. 奇数が含まれるかの判定

整数の配列 numbers を受け取り、奇数が含まれるかどうかを返す関数 hasOdd を実装

```js
function hasOdd(numbers) {
  if (Array.isArray(numbers) === false) {
    console.log(numbers + ": Invalid input");
    return;
  }
  
  for (let i = 0; i < numbers.length; i++) {
    if (numbers[i] % 2 !== 0) {
      console.log(numbers[i] + ": true");
    } else if (numbers[i] % 2 === 0) {
      console.log(numbers[i] + ": false");
    } else {
      console.log("Invalid input");
    }
  }
}

hasOdd([1, 2, 3, 4, 5])
hasOdd(1)
hasOdd("hoge")

```

### 2. 奇数の抽出

整数の配列 numbers を受け取り、奇数のみの配列を返す関数 odd を実装

```
function odd(numbers) {
  let odd_numbers = [];
  
  if (Array.isArray(numbers) === false) {
    console.log(numbers + ": Invalid input");
    return;
  }
  
  for (let i = 0; i < numbers.length; i++) {
    if (numbers[i] % 2 !== 0) {
      odd_numbers.push(numbers[i]);
    }
  }
  console.log(odd_numbers);
}

odd([1, 2, 3, 4, 5])
odd(1)
odd("hoge")
```

### 3. 2乗の計算

整数の配列 numbers を受け取り、各要素を2乗した配列を返す関数 square を実装
