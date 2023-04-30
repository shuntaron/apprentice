## シェルスクリプトを書くことができる

### 1. Hello
```console
$ cat << EOF > ~/01_hello.sh
> #!/bin/bash
> echo "Hello!"
> EOF
$ ls -l --time-style="+" ~/01_hello.sh
-rw-rw-r-- 1 ec2-user ec2-user 26  /home/ec2-user/01_hello.sh
$ chmod 755 ~/01_hello.sh
$ ls -l --time-style="+" ~/01_hello.sh
-rwxr-xr-x 1 ec2-user ec2-user 26  /home/ec2-user/01_hello.sh
$ ./01_hello.sh
Hello!
```

### 2. 標準入力から値を受け取る

### 3. 条件分岐

### 4. 繰り返し処理
