#!/bin/bash

# パスワード管理ファイルのファイル名を変数へ格納
password_file=password.txt

echo "パスワードマネージャーへようこそ！"

# 入力値を変数へ格納
read -p "サービス名を入力してください：" service
read -p "ユーザー名を入力してください：" username
read -sp "パスワードを入力してください：" password

echo "$service:$username:$password" >> $password_file
echo "Thank you!"
