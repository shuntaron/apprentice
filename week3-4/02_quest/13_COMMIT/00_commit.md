## コミットができる

### 1. ローカルリポジトリの新規作成
```console
# ローカルリポジトリの作成
$ mkdir git_practice
$ cd git_practice
$ git init
```
### 2. 変更をステージに追加
```console
$ touch README.md
$ git add README.md
```

### 3. 変更を記録
```console
$ git commit -m "Add README.md"
[main a14375c] Add README.md
 Date: Sun Apr 30 12:41:13 2023 +0000
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 README.md
```
