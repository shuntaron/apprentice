## ディレクトリ操作

### 1. 現在のディレクトリ
自分が現在いるディレクトリを表示してください。
```
$ pwd
/home/ec2-user
```
### 2. ルートディレクトリ
現在のディレクトリから、"/" ディレクトリに移動してください。
```
$ cd /
$ pwd
/
```
### 3. ホームディレクトリ
現在のディレクトリから、ホームディレクトリに移動してください。
```
$ cd ~
$ pwd
/home/ec2-user
```
### 4. 一つ上のディレクトリ
現在のディレクトリから、一つ上の親ディレクトリに移動してください。
```
$ cd ..
$ pwd
/home
```
### 5. ディレクトリの内容
現在のディレクトリの内容を表示してください。
```
$ ls
ec2-user
```
### 6. 隠しファイル
現在のディレクトリの隠しファイルを含む全てのファイルとディレクトリを表示してください。
```
$ ls -a
.  ..  .hidden  ec2-user  file
```
### 7. 詳細なリスト形式
"/etc" ディレクトリの内容を、詳細なリスト形式で表示してください。
"man ls" コマンドで ls コマンドの詳細を確認することができます。"List files in the long format" といった説明のあるオプションを付けてください。

```
$ cd /etc
$ ls -l
合計 1124
-rw-r--r--  1 root root     5090  1月 23  2020 DIR_COLORS
-rw-r--r--  1 root root     5725  1月 23  2020 DIR_COLORS.256color
-rw-r--r--  1 root root     4669  1月 23  2020 DIR_COLORS.lightbgcolor
.
.
.
```

### 8. ディレクトリの作成
```
$ cd ~
$ mkdir projects
$ ls -d projects
projects
```
ホームディレクトリに移動し、"projects" という名前のディレクトリを作成してください。

### 9. ディレクトリの削除
作成した "projects" ディレクトリを削除してください。
```
$ rm -r projects
$ ls -d projects
ls: projects にアクセスできません: No such file or directory
```
