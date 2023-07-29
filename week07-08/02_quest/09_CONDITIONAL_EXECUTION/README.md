# 条件分岐

## 1. 温度チェッカー

温度 t に応じて以下のように出力する関数 checkTemperature を定義

- t が 30 以上の場合は "Hot"
- t が 30 未満かつ 15 以上の場合は "Warm"
- t が 15 未満の場合は "Cold"

```javascript
function checkTemperature(t) {
  if (t >= 30) {
    console.log("Hot");
  } else if (t >= 15 && t < 30) {
    console.log("Warm");
  } else {
    console.log("Cold");
  }
}

checkTemperature(30)
checkTemperature(15)
checkTemperature(14)
```

## 2. 偶数チェッカー
整数 n が偶数か奇数かを判定する関数 checkOddOrEven を定義

```javascript
function checkOddOrEven(n) {
  if (n % 2 === 0) {
    console.log("Even");
  } else if (n % 2 === 1) {
    console.log("Odd");
  } else {
    console.log("Unable to check");
  }
}

checkOddOrEven(2)
checkOddOrEven(1)
checkOddOrEven(0)
checkOddOrEven("hoge")
checkOddOrEven(0.1)
```
