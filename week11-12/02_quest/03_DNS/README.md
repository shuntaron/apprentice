## DNS について

### 1. ドメインとは
ドメインとはインターネットにおける住所の役割を果たすもので IP アドレスの数字の羅列を文字列に変換し、人にとってわかりやすくしたもの

### 2. DNS とは
DNS とは、Domain Name System の略で、インターネット上で ドメイン名と IP アドレスの対応関係を管理するシステムのこと  
ドメイン名を IP アドレスに変換することを名前解決という

### 3. ドメイン名と IP アドレスの対応
www.google.com と IP アドレスの対応  
ブラウザで www.google.com に紐づく IP アドレスへアクセスすることで、www.google.com が開かれることを確認できる  

```console
$ nslookup www.google.com
Server:   xxx.xxx.xxx.xxx
Address:  xxx.xxx.xxx.xxx#xx

Non-authoritative answer:
Name:     www.google.com
Address:  xxx.xxx.xxx.xxx
```
