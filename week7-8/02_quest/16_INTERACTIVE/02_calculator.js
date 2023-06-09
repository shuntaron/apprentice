// ページ読み込み時のイベントハンドラを登録
window.addEventListener('DOMContentLoaded', function() {
  
  // 文字列の末尾が数値か判定する関数
  function isNumericEnd(str) {
    // 文字列の末尾が数値の場合
    if (str.match(/\d+$/)) {
      return true;
    } else {
      return false;
    }
  }
  
  // click イベントのイベントハンドラを登録
  document.addEventListener("click", function (e) {
    // クリックされた要素の class 名が digit の場合
    if (e.target.classList.contains("digit")) {
      // クリックされた要素のテキストを取得
      let digit = e.target.textContent;
      // テキストフィールドの値にクリックされた要素のテキストを追加
      document.getElementById("display").innerText += digit;
    }
    
    // クリックされた要素の class 名が operator の場合
    if (e.target.classList.contains("operator")) {
      // display の値を取得
      let display = document.getElementById("display").innerText;
      // display の末尾に数字が入力されている場合
      if (isNumericEnd(display)) {
        // クリックされた要素のテキストを取得
        let digit = e.target.textContent;
        // テキストフィールドの値にクリックされた要素のテキストを追加
        document.getElementById("display").innerText += digit;
      }
    }
    
    // クリックされた要素の id 名が equals の場合
    if (e.target.id === "equals") {
      // display の値を取得
      let display = document.getElementById("display").innerText;
      // display の末尾に数字が入力されている場合
      if (isNumericEnd(display)) {
        // display の値を計算
        result = eval(display);
        // display の値を計算結果に変更
        document.getElementById("display").innerText = result;
      }
    }
  });
});
