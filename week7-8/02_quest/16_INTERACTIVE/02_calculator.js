// ページ読み込み時のイベントハンドラを登録
window.addEventListener('DOMContentLoaded', function() {
  
  // click イベントのイベントハンドラを登録
  document.addEventListener("click", function (e) {
    // クリックされた要素のクラス名が digit の場合
    if (e.target.classList.contains("digit")) {
      // クリックされた要素のテキストを取得
      let digit = e.target.textContent;
      // テキストフィールドの値にクリックされた要素のテキストを追加
      document.getElementById("display").innerText = digit;
    }
  });
  
});
