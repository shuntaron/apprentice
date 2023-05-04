## GitHub フローに従って開発を進めることができる

### 1. プルリクエストとは
GitHubが提供するソースコードの変更通知機能  
開発者が他の開発者にソースコードのレビューと開発用・公開用ブランチへのマージを依頼するために使用する  
基本的にチーム開発や複数での開発に利用され、本機能を使って複数人でコードレビューを行うことでソースコードの品質を向上させることができる  

### 2. プルリクエストの作成
```console
$ # 1. pullrequestブランチの作成
$ git switch -c pullrequest
Switched to a new branch 'pullrequest'
$ git branch
  main
* pullrequest

$ # 2. ファイルの作成
$ echo "# PULLREQUEST" >> PULLREQUEST.md

$ # 3. 変更のコミット
$ git add PULLREQUEST.md
$ git commit -m "Add PULLREQUEST.md"
[pullrequest 052b89e] Update README.md
 1 file changed, 1 insertion(+)
 create mode 100644 PULLREQUEST.md
$ git push origin pullrequest
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 324 bytes | 324.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
remote: 
remote: Create a pull request for 'pullrequest' on GitHub by visiting:
remote:      https://github.com/shuntaron/git_practice/pull/new/pullrequest
remote: 
To github:shuntaron/git_practice.git
 * [new branch]      pullrequest -> pullrequest

$ # 4. GitHub に pullrequest というブランチ名で変更をプッシュ
$ # 5. GitHub を開き、pullrequest ブランチから main ブランチへのプルリクエストを作成
$ # 6. 変更内容を確認し、問題なければ GitHub 上で変更をマージ
$ # 7. GitHub 上の pullrequest ブランチを削除
```

### ３. ローカルへのリポートリポジトリの変更内容の取り込み
```console
$ # ローカルリポジトリのブランチを pullrequest ブランチから main ブランチへ切り替え
$ git switch main
Switched to branch 'main'
Your branch is up to date with 'origin/main'.
$ git branch
* main
  pullrequest

$ # リモートリポジトリ（GitHub）の main ブランチの内容をローカルリポジトリの main ブランチに取り込む
$ git pull origin main
remote: Enumerating objects: 1, done.
remote: Counting objects: 100% (1/1), done.
remote: Total 1 (delta 0), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (1/1), 627 bytes | 627.00 KiB/s, done.
From github.com:shuntaron/git_practice
 * branch            main       -> FETCH_HEAD
   52c4c36..00c11e1  main       -> origin/main
Updating 52c4c36..00c11e1
Fast-forward
 PULLREQUEST.md | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 PULLREQUEST.md

$ # ローカルリポジトリの pullrequest ブランチを削除
$ git branch -d pullrequest
Deleted branch pullrequest (was 9f66dd6).
$ git branch
* main
```

### 4. GitHub フロー

[GitHub フロー](https://docs.github.com/ja/get-started/quickstart/github-flow) 
