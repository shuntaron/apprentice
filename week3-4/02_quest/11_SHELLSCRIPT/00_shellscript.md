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
```console
$ cat << "EOF" > ~/02_welcome.sh
> #!/bin/bash
> echo "What's your name?"
> read name
> echo "Welcome! $name"
> EOF
$ ls -l --time-style="+" ~/02_welcome.sh
-rwxr-xr-x 1 ec2-user ec2-user 69  /home/ec2-user/02_welcome.sh
$ chmod 755 ~/02_welcome.sh
$ ls -l --time-style="+" ~/02_welcome.sh
-rwxr-xr-x 1 ec2-user ec2-user 69  /home/ec2-user/02_welcome.sh
$ ./02_welcome.sh
What's your name?
shuntaron
Welcome! shuntaron
```

### 3. 条件分岐

### 4. 繰り返し処理
