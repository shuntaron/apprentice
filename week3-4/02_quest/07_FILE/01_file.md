## ファイル操作

### 1. ファイルの中身を出力
```
$ cat /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost6 localhost6.localdomain6
```

### 2. ファイルの中身をスクロール表示
```
$ less /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost6 localhost6.localdomain6
/etc/hosts (END)
```

### 3. ファイルの作成
```
$ touch README.md
$ ls README.md
README.md
```

### 4. ファイル名の変更
```
$ mv README.md TMP.md
$ ls TMP.md
TMP.md
```

### 5. ファイルのコピー
```
$ cp TMP.md COPY.md
$ ls COPY.md
COPY.md
```

### 6. ファイルの削除
```
$ rm TMP.md
$ ls TMP.md
ls: TMP.md にアクセスできません: No such file or directory
```

### 7. シンボリックリンク
```
$ ls -l --time-style="+" READ*
-rw-rw-r-- 1 ec2-user ec2-user 0  README.md
lrwxrwxrwx 1 ec2-user ec2-user 9  README_SYMBOLIC.md -> README.md
$ echo "Hello World" > README.md
$ cat README_SYMBOLIC.md
Hello World
```

### 8. ファイルの検索
```
$ find . -maxdepth 1 -name "README*"
./README.md
./README_SYMBOLIC.md
```

### 9. 検索
```
$ touch ~/sample.txt
$ cat << EOF > sample.txt
apple
banana
grape
lemon
EOF
$ grep "a" sample.txt
apple
banana
grape
```
