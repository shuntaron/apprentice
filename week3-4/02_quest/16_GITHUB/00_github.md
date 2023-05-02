## GitHub を使って開発を進めることができる

### 1. リモートリポジトリ

GitHub 上に新規リポジトリを作成  
https://github.com/new

### 2. プッシュ
```bash
$ mkdir git_practice
$ cd git_practice
$ touch README.md
$ git init
$ git add README.md
$ git commit -m "first commit"
[main (root-commit) 26ccf3b] first commit
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 README.md
$ git branch -M main
$ git remote add origin git@github.com:shuntaron/git_practice.git
$ git remote -v
origin  git@github.com:shuntaron/git_practice.git (fetch)
origin  git@github.com:shuntaron/git_practice.git (push)
$ git push -u origin main
Enumerating objects: 3, done.
Counting objects: 100% (3/3), done.
Writing objects: 100% (3/3), 224 bytes | 224.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
To github.com:shuntaron/github_practice.git
 * [new branch]      main -> main
branch 'main' set up to track 'origin/main'.
```

### 3. 追加の変更をプッシュ
```bash
$ echo "# git_practice" >> README.md
$ git diff
```
```diff
diff --git a/README.md b/README.md
index e69de29..1b3f470 100644
--- a/README.md
+++ b/README.md
@@ -0,0 +1 @@
+# git_practice
```
```bash
$ git add README.md
$ git commit -m "Update README.md"
[main 7f5bc43] Update README.md
 1 file changed, 1 insertion(+)
$ git push
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Writing objects: 100% (3/3), 280 bytes | 280.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
To github-shuntaron:shuntaron/git_practice.git
   26ccf3b..7f5bc43  main -> main
```

### 4. クローン
```bash
$ git clone git@github.com:shuntaron/git_practice.git
Cloning into 'git_practice'...
remote: Enumerating objects: 6, done.
remote: Counting objects: 100% (6/6), done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 6 (delta 0), reused 6 (delta 0), pack-reused 0
Receiving objects: 100% (6/6), done.
$ ls -ld --time-style='+' git_practice
drwxrwxr-x 3 ec2-user ec2-user 35  git_practice
```
