## ブランチを利用して開発を進めることができる

### 1. ブランチの新規作成
```console
# featureブランチの新規作成
$ git branch feature
$ git branch
  feature
* main
```
### 2. ブランチの切り替え
```console
# mainブランチからfeatureブランチへ切り替え
$ git switch feature
Switched to branch 'feature'
$ git branch
* feature
  main
```

### 3. マージ
```console
# ファイルの変更（ワーキングツリーの変更）
$ sed -i -e '$d' README.md 
$ git diff
```
````diff
diff --git a/README.md b/README.md
index f2f1160..2cca488 100644
--- a/README.md
+++ b/README.md
@@ -21,4 +21,3 @@ You can initialize this repository with code from a Subversion, Mercurial, or TF
 ```
 [Import code](https://github.com/shuntaron/git_practice/import)
 ```
-hoge
````
```console
# ワーキングツリーの変更をステージエリアへ追加
$ git add README.md

# featureブランチの変更をコミット
$ git commit -m "Update README.md"
[feature d8fc005] Update README.md
 1 file changed, 1 deletion(-)
```
```console
# featureブランチからmainブランチへ切り替え
$ git switch main
Switched to branch 'main'
Your branch is up to date with 'origin/main'.
$ git branch
  feature
* main

# mainブランチへfeatureブランチをマージ
$ git merge feature
Updating bac2a94..52c4c36
Fast-forward
 README.md | 1 -
 1 file changed, 1 deletion(-)
$ git log
commit 52c4c36ffee687ac74fbf6272ada67c209d25d91 (HEAD -> main, feature)
Author: shuntaron <130245866+shuntaron@users.noreply.github.com>
Date:   Wed May 3 13:17:38 2023 +0000

    Update README.md
```

### 4. ブランチの名前の変更
```console
# feature ブランチを rename ブランチへリネーム
$ git branch -m feature rename
$ git branch
* main
  rename
```

### 5. ブランチの削除
```console
# rename ブランチの削除
$ git branch -d rename
Deleted branch rename (was 52c4c36).
$ git branch
* main
```

###  参考

- checkout と switch と restore の対応

| git checkout              | git switch    | git restore                       |
| ------------------------- | ------------- | --------------------------------- |
| git checkout              | git switch    |                                   |
| git checkout -b           | git switch -c |                                   |
| git checkout HEAD         |               | git restore                       |
| git checkout hash(branch) |               | git restore --source hash(branch) |
