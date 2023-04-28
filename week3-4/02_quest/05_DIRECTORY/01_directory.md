## ディレクトリ操作

### 1. 現在のディレクトリ
```bash
$ pwd
/home/ec2-user
```
### 2. ルートディレクトリ
```bash
$ cd /
$ pwd
/
```
### 3. ホームディレクトリ
```bash
$ cd ~
$ pwd
/home/ec2-user
```
### 4. 一つ上のディレクトリ
```bash
$ cd ..
$ pwd
/home
```
### 5. ディレクトリの内容
```bash
$ ls
ec2-user
```
### 6. 隠しファイル
```bash
$ ls -a
.  ..  .hidden  ec2-user  file
```
### 7. 詳細なリスト形式
```bash
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
```bash
$ cd ~
$ mkdir projects
$ ls -d projects
projects
```

### 9. ディレクトリの削除
```bash
$ rm -r projects
$ ls -d projects
ls: projects にアクセスできません: No such file or directory
```
