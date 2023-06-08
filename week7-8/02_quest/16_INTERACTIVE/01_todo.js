// ページ読み込み時のイベントハンドラを登録
window.addEventListener('DOMContentLoaded', function() {
  // form の要素を取得
  const form = document.querySelector("form");
  
  // #todo-list の要素を取得し、変数todo-listに代入
  const todo_list = document.getElementById("todo-list");
  
  // form の submit イベントのイベントハンドラを登録
  form.addEventListener("submit", function(e) {
    // EventオブジェクトのpreventDefaultメソッドをキャンセルし、フォーム送信を無効化
    e.preventDefault();
    
    // テキストフィールドの値を取得
    let todo = document.getElementById("todo-input").value;
    
    // タイトルと本文の値を #posts の要素に追加
    todo_list.innerHTML += `
      <li class="todo-item">
        <input type="checkbox">
        <span>
          ${todo}
        </span>
        <button class="delete-button">
          削除
        </button>
      </li>
    `;
    
    // タイトルと本文の値を空文字にする
    document.getElementById("todo-input").value = "";
  });
});
