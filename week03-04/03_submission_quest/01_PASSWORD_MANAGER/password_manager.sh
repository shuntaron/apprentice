#!/bin/bash

# パスワードファイル名を変数へ格納
password_file=password.txt
encrypted_password_file=password.enc

# 暗号化関数（共通鍵暗号方式）
function encrypt() {
  openssl enc -aes256 -e \
          -in $password_file \
          -out $encrypted_password_file \
          -pass pass:$manager_password \
          -base64 2>/dev/null
}

# 復号化関数（共通鍵暗号方式）
function decrypt() {
  openssl enc -aes256 -d \
          -in $encrypted_password_file \
          -out $password_file \
          -pass pass:$manager_password \
          -base64 2>/dev/null
}

# 管理用パスワードチェック関数（共通鍵暗号方式）
function checkcrypt() {
  openssl enc -aes256 -d \
          -in $encrypted_password_file \
          -pass pass:$manager_password \
          -base64 > /dev/null 2>&1
}

# 処理部
echo "パスワードマネージャーへようこそ！"

# 管理用パスワードの確認処理
# 暗号文パスワードファイルが存在する場合
if [[ -f $encrypted_password_file ]]; then
  read -sp "管理用パスワードを入力してください：" manager_password
  echo ""
  # 管理用パスワードが正しいか確認
  checkcrypt
  status=$?
  # 管理用パスワードが正しくない場合
  if [[ $status -eq 1 ]]; then
    echo "入力されたパスワードが正しくありません。"
    # プログラム終了
    echo "Thank you!"
    exit
  fi
# 暗号文パスワードファイルが存在しない場合
else
  echo "管理用パスワードを登録します。"
  read -sp "管理用パスワードを入力してください：" manager_password
  echo ""
  echo "管理用パスワードを登録しました。"
fi


# パスワードマネージャーの処理
echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："

# Exit を入力するまで繰り返し
while :
do
  # 選択肢の入力値を変数へ格納
  read option
  
  # 選択肢の入力値によって分岐処理
  shopt -s nocasematch  #大文字と小文字を区別しない
  case $option in
  
    # Add Password が入力された場合
    "Add Password" )
      
      # 入力値を変数へ格納
      read -p "サービス名を入力してください：" service
      read -p "ユーザー名を入力してください：" username
      read -sp "パスワードを入力してください：" password
      echo ""

      # 暗号文パスワードファイルを復号化
      decrypt

      # 平文パスワードファイルへ情報を追記
      echo "$service:$username:$password" >> $password_file
      
      # 平文パスワードファイルを暗号化
      encrypt
      
      # 平文パスワード管理ファイルを削除
      rm -f $password_file
      
      echo "パスワードの追加は成功しました。"
      echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
      ;;
    
    # Get Password が入力された場合
    "Get Password" )

      # 入力値を変数へ格納
      echo "サービス名を入力してください："
      read service

      # 暗号文パスワードファイルを復号化
      decrypt

      # パスワードファイルのサービス名を部分一致（大文字小文字を区別しない）でgrepし、マッチした行を変数へ格納
      result=$(grep -E --ignore-case "^.*$service.*:.*:.*$" $password_file 2>/dev/null)
      
      # 平文パスワードファイルを削除
      rm -f $password_file
      
      # サービス名が保存されていなかった場合
      if [[ -z $result ]]; then
        echo "そのサービスは登録されていません。"
      # サービス名が保存されていた場合
      else
        # デフォルトの区切り文字($' \t\n')を変数へバックアップ
        OLDIFS=$IFS
        
        # デフォルトの区切り文字($' \t\n')を削除
        #  (後続のechoで改行を区切り文字として処理させないため)
        IFS=""
        
        # grepでマッチした行数分繰り返し
        echo $result | while read line
        do
          # サービス名:ユーザー名:パスワードの各項目を変数へ格納
          service=$(echo $line  | cut -d: -f1)
          username=$(echo $line | cut -d: -f2)
          password=$(echo $line | cut -d: -f3)
          
          # 結果を出力
          echo "サーピス名:$service"
          echo "ユーザー名:$username"
          echo "パスワード:$password"
          echo ""
        done
        
        # 区切り文字をデフォルト値へ戻す
        IFS=$OLDIFS
      fi
      
      echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
      ;;
    
    # Exit が入力された場合
    "Exit" )
      break
      ;;
    
    # Add Password/Get Password/Exit 以外が入力された場合
    * )
      echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
      ;;
  esac
done

# プログラム終了
echo "Thank you!"
