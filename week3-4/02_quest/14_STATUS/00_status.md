## 変更状況を確認できる
```console
$ cd git_practice
$ echo "hoge" >> README.md
```

### 1. 変更状況の確認
```console
$ git status
On branch main
Your branch is up to date with 'origin/main'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   README.md

no changes added to commit (use "git add" and/or "git commit -a")
```

### 2. 変更内容の確認
```console
$ git diff
```

````diff
diff --git a/README.md b/README.md
index 2cca488..f2f1160 100644
--- a/README.md
+++ b/README.md
@@ -21,3 +21,4 @@ You can initialize this repository with code from a Subversion, Mercurial, or TF
 ```
 [Import code](https://github.com/shuntaron/git_practice/import)
 ```
+hoge
````

### 3. 変更履歴
```console
$ git log
commit 39703ecd128fd8a27985cd23dbea7b3083e75633 (HEAD -> main, origin/main)
Author: shuntaron <130245866+shuntaron@users.noreply.github.com>
Date:   Sun Apr 30 13:06:50 2023 +0000

    Add README.md
```
