# 条件分岐を使うことができる

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
