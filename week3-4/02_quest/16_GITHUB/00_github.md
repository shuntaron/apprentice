## GitHub を使って開発を進めることができる

### 1. リモートリポジトリ

GitHub 上に新規リポジトリを作成  
https://github.com/new

### 2. プッシュ
```console
$ mkdir git_practice
$ cd git_practice
$ touch README.md
$ git init
$ git add README.md
$ git commit -m "first commit"
$ git branch -M main
$ git remote add origin git@github.com:shuntaron/git_practice.git
$ git push -u origin main
```

### 3. 追加の変更をプッシュ
```console
$ echo "# git_practice" >> README.md
$ git add README.md
$ git commit -m "Update README.md"
$ git push
```

### 4. クローン
```console
$ git clone git@github.com:shuntaron/git_practice.git
$ ls -ld --time-style='+' git_practice
drwxrwxr-x 3 ec2-user ec2-user 35  git_practice
```
