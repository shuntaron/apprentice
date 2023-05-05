#!/bin/bash

echo "パスワードマネージャーへようこそ！"
echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："

while :
do
  read option
  
  case $option in
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
      
    "Get Password" )
      echo "サービス名を入力してください："
      read service
      
      result=$(grep -E "^.*$service.*:.*:.*" 02_password.txt)
      
      if [[ -z $result ]]; then
        ## サービス名が保存されていなかった場合
        echo "そのサービスは登録されていません。"
      else
        ## サービス名が保存されていた場合
        
        OLDIFS=$IFS
        IFS='\n'
        
        echo $result | while read line
        do
          service=$(echo $line | cut -f1 -d:)
          username=$(echo $line | cut -f2 -d:)
          password=$(echo $line | cut -f3 -d:)
          echo "サーピス名:$service"
          echo "ユーザー名:$username"
          echo "パスワード:$password"
          echo ""
        done
        
        IFS=$OLDIFS
      fi
      echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
      ;;
    "Exit" )
      break
      ;;
      
    * )
      echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
      ;;
  esac
done

echo "Thank you!"
