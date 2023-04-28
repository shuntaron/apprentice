## 標準入出力を扱える

### 1. 標準入出力とは
プロセスが持つ以下3つの通信チャネルの総称。  
全てのプロセスはファイルディスクリプタというファイル書き込み用の通信チャネルを持っており、シェルは標準入力・標準出力・エラー出力の3つのファイルをオープンする。  
そして、それらをファイルディスクリプタ0、1、2として管理している。

0. 標準入力（stdin）  
  - プログラムの標準的な入力。  
  - キーボードからの入力。
1. 標準出力（stdout）  
  - プログラムの標準的な出力。  
  - 画面への出力。
2. 標準エラー出力（stderr）  
  - プログラムのエラーメッセージを出力するための標準的な出力。  
  - 画面への出力。

### 2. リダイレクト
```console
$ ls / > ~/root.txt
$ cat ~/root.txt
<summary>stdout</summary>
<details>
bin
boot
dev
etc
home
lib
lib64
local
media
mnt
opt
proc
root
run
sbin
srv
sys
tmp
usr
var
</details>
```

### 3. エラー出力のリダイレクト
```console
$ ls /hoge 2> ~/error.txt
$ cat ~/error.txt
ls: /hoge にアクセスできません: No such file or directory
```

### 4. 出力とエラー出力のリダイレクト
```console
$ ls / /hoge > ~/result.txt 2>&1
$ cat ~/result.txt
<details>
ls: /hoge にアクセスできません: No such file or directory
/:
bin
boot
dev
etc
home
lib
lib64
local
media
mnt
opt
proc
root
run
sbin
srv
sys
tmp
usr
var
</details>
```

### 5. /dev/null とは
/dev/nullとは、LinuxなどのUNIX系OSの特殊なデバイスファイルの一種で、投入された入力を単に捨て去る機能を提供するもの。  
英語圏では俗に “black hole” （ブラックホール）、“bit bucket” （ビットバケツ）などと呼ばれることもある。
何らかの出力先の指定が必要だが何の処理もしたくない場合や、標準では画面に表示されるメッセージなどを抑止したい場合、空の入力元が必要な場合などに利用される。
### 6. /dev/null へのリダイレクト
```console
$ ls / > /dev/null
$
```

### 7. パイプライン
```console
$ ls / | grep "^l"
lib
lib64
local
```
