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
