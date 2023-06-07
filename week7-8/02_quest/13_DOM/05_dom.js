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
    
    // タイトルと本文の値を空文字にする
    document.getElementById("title").value = "";
    document.getElementById("content").value = "";
    
    // タイトルと本文の値を空文字にする（他の方法）
    // フォームの値をリセット
    // form.reset();
  });
});
