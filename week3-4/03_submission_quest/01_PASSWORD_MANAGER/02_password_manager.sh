#!/bin/bash

echo "パスワードマネージャーへようこそ！"
echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："

# Exit を入力するまで繰り返し
while :
do
  # 選択肢の入力値を変数へ格納
  read option
  
  # 選択肢の入力値によって分岐処理
  case $option in
  
    # Add Password が入力された場合
    "Add Password" )
      echo "サービス名を入力してください："
      read service
      echo "ユーザー名を入力してください："
      read username
      echo "パスワードを入力してください："
      read -s password
      echo "$service:$username:$password" >> 02_password.txt
      echo "パスワードの追加は成功しました。"
      
      echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
      ;;
    
    # Get Password が入力された場合
    "Get Password" )
      echo "サービス名を入力してください："
      read service
      
      # パスワード管理ファイルのサービス名を部分一致でgrepし、マッチした行を変数へ格納
      result=$(grep -E "^.*$service.*:.*:.*" 02_password.txt)
      
      # サービス名が保存されていなかった場合
      if [[ -z $result ]]; then
        echo "そのサービスは登録されていません。"
      # サービス名が保存されていた場合
      else
        # デフォルトの区切り文字($' \t\n')を変数へバックアップ
        OLDIFS=$IFS
        # デフォルトの区切り文字($' \t\n')を削除
        #  (後続のechoで改行を区切り文字として処理させないため)
        unset $IFS
        
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
