#!/bin/bash

# パスワード管理ファイルのファイル名を変数へ格納
password_file=03_password.txt
encrypted_password_file=03_password.gpg

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
      
      # 暗号化されたパスワード管理ファイルが存在する場合
      if [[ -f $encrypted_password_file ]]; then
        # 暗号化されたパスワード管理ファイルを復号化
        gpg --yes --output $password_file --decrypt $encrypted_password_file
      fi
      
      # 平文パスワード管理ファイルへ情報を追記
      echo "$service:$username:$password" >> $password_file
      
      # 平文パスワード管理ファイルを暗号化
      gpg --yes --output $encrypted_password_file --encrypt --recipient shuntaron $password_file
      
      # 平文パスワード管理ファイルを削除
      rm -f $password_file
      
      echo "パスワードの追加は成功しました。"
      
      echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
      ;;
    
    # Get Password が入力された場合
    "Get Password" )
      echo "サービス名を入力してください："
      
      # 入力値を変数へ格納
      read service
      
      # 暗号化されたパスワード管理ファイルが存在する場合
      if [[ -f $encrypted_password_file ]]; then
        # パスワード管理ファイルを復号化
        gpg --yes --output $password_file --decrypt $encrypted_password_file
      fi
      
      # パスワード管理ファイルのサービス名を部分一致でgrepし、マッチした行を変数へ格納
      result=$(grep -E "^.*$service.*:.*:.*" $password_file 2>/dev/null)
      
      # 復号化した平文ファイルを削除
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
