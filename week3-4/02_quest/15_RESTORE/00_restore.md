## 変更を元に戻すことができる
````console
$ sed -i -e '$d' README.md 
````
````diff
$ git diff
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

### 1. ファイルの変更の取り消し
````console
$ git restore README.md
$ git diff
````

### 2. ステージの変更の取り消し
````console
$ sed -i -e '$d' README.md 
$ git diff
````
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
$ git add README.md
$ git diff
$ git restore --staged README.md
$ git diff
````
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
