## ディレクトリ操作

### 1. 現在のディレクトリ
```console
$ pwd
/home/ec2-user
```
### 2. ルートディレクトリ
```console
$ cd /
$ pwd
/
```
### 3. ホームディレクトリ
```console
$ cd ~
$ pwd
/home/ec2-user
```
### 4. 一つ上のディレクトリ
```console
$ cd ..
$ pwd
/home
```
### 5. ディレクトリの内容
```console
$ ls
ec2-user
```
### 6. 隠しファイル
```console
$ ls -a
.  ..  .hidden  ec2-user  file
```
### 7. 詳細なリスト形式
```console
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
```console
$ cd ~
$ mkdir projects
$ ls -d projects
projects
```

### 9. ディレクトリの削除
```console
$ rm -r projects
$ ls -d projects
ls: projects にアクセスできません: No such file or directory
```
