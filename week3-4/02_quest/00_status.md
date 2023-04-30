## 変更状況を確認できる
````console
$ cd git_practice
$ echo << "EOF" > README.md
## create a new repository on the command line
```
echo "# git_practice" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:shuntaron/git_practice.git
git push -u origin main
```

## push an existing repository from the command line
```
git remote add origin git@github.com:shuntaron/git_practice.git
git branch -M main
git push -u origin main
```

## import code from another repository
You can initialize this repository with code from a Subversion, Mercurial, or TFS project.
```
[Import code](https://github.com/shuntaron/git_practice/import)
```
````

### 1. 変更状況の確認
```console
$ git status
On branch main
Your branch is ahead of 'origin/main' by 1 commit.
  (use "git push" to publish your local commits)

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   README.md

no changes added to commit (use "git add" and/or "git commit -a")
```

### 2. 変更内容の確認

### 3. 変更履歴

