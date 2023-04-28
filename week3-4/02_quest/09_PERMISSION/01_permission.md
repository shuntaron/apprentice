## パーミッションを操作できる

### 1. ファイルのオーナーとグループ
```console
$ touch ~/README.md
$ ls -l --time-style="+" ~/READ*
-rw-rw-r-- 1 ec2-user ec2-user 0  /home/ec2-user/README.md
```

### 2. ファイルのパーミッション
```console
-rw-rw-r-- 1 ec2-user ec2-user 0  /home/ec2-user/README.md
```
- 属性  

| file type | file mode   | number of links | owner name | group name | number of bytes in the file | the pathname             |
| --------- | ----------- | --------------- | ---------- | ---------- | --------------------------- | ------------------------ |
| `-`       | `rw-rw-r--` | 1               | ec2-user   | ec2-user   | 0                           | /home/ec2-user/README.md |

  - ファイルタイプ（`d`:ディレクトリ、`l`:シンボリックリンク、`-`:ファイル）  
  `-`: 通常のファイル  
  - ファイルモード
    - パーミッション（`r`(4):読み取り可、`w`(2):書き込み可、`x`(1):実行可、`-`:許可なし）  
    `rw-`(6):  オーナーの権限。読み取りと書き込みのみ可能。  
    `rw-`(6):  グループの権限。読み取りと書き込みのみ可能。  
    `r--`(4):  他ユーザの権限。読み取りのみ可能。  

### 3. ファイルのパーミッションの設定
```console
$ chmod 764 ~/README.md
$ ls -l --time-style="+" ~/READ*
-rwxrw-r-- 1 ec2-user ec2-user 0  /home/ec2-user/README.md
```

### 4. ディレクトリのパーミッションの設定
```console
$ mkdir ~/permission
$ ls -ld --time-style="+" ~/permission
drwxrwxr-x 2 ec2-user ec2-user 6  /home/ec2-user/permission
$ chmod 755 ~/permission
$ ls -ld --time-style="+" ~/permission
drwxr-xr-x 2 ec2-user ec2-user 6  /home/ec2-user/permission
$ chmod 775 ~/permission
$ ls -ld --time-style="+" ~/permission
drwxrwxr-x 2 ec2-user ec2-user 6  /home/ec2-user/permission
```

### 5. スーパーユーザー
```console
$ sudo mkdir ~/superuser
$ ls -ld --time-style="+" ~/superuser
drwxr-xr-x 2 root root 6  /home/ec2-user/superuser
```
