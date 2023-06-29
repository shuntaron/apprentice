## ポート番号について

### 1. ポート番号とは
ポート番号とは、TCP/IP通信において、 コンピュータが通信に使用するプログラムを識別するための番号のこと  
ポート番号は16ビットの整数であり、 0番から65535番まで存在する  

ポート番号には、下記のような三つの種別がある
ポート番号の一覧はIANAのWebサイトで確認できる
http://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xhtml

1. WELL KNOWN PORT NUMBERS (ウェルノウンポート番号)  
0番～1023番  
IANA (Internet Assigned Numbers Authority) が管理する使用目的が定められたポート番号

2. REGISTERED PORT NUMBERS (登録ポート番号)  
1024番～49151番
IANA が登録を受け付け、 公開しているポート番号
3. DYNAMIC AND/OR PRIVATE PORTS (ダイナミック/プライベートポート番号)  
49152番～65535番
誰でも自由に使用できるポート番号

### 2. 代表的なポート番号

### 2-1. 代表的なウェルノウンポート番号
ポート番号 | TCP/UDP | サービス名 | 備考
-- | -- | -- | --
20 | TCP | ftp-data | ファイル転送（データ本体）
21 | TCP | ftp | ファイル転送（コントロール）
22 | TCP | ssh | リモートログイン（セキュア）
23 | TCP | telnet | リモートログイン
25 | TCP | smtp | メール送信
53 | TCP | domain | DNS
67 | UDP | bootps | IPアドレス等の自動取得
68 | UDP | bootpc | IPアドレス等の自動取得
69 | UDP | TFTP | 特定PC間のファイル転送
70 | TCP | gopher | Gopher
79 | TCP | finger | Finger
80 | TCP | http | www
109 | TCP | pop2 | メール受信（バージョン2）
110 | TCP | pop3 | メール受信（バージョン3）
123 | UDP | ntp | 時刻合わせ
137 | UDP | netbios-ns | NETBIOS Name Service
138 | UDP | netbios-dgm | NETBIOS Datagram Service
139 | UDP | netbios-ssn | NETBIOS Session Service
143 | TCP | imap | メール受信
161 | UDP | snmp | ネットワーク機器監視
162 | UDP | snmptrap | SNMPTRAP
220 | TCP | imap3 | メール受信（バージョン3）
443 | TCP | https | www（セキュア）
465 | TCP | smtps | メール送信（セキュア）
520 | UDP | router | ルーティングプロトコル
990 | TCP | ftps | ファイル転送（セキュア）
993 | TCP | imaps | メール受信（バージョン4）
995 | TCP | pop3s | メール受信（バージョン3セキュア）

### 2-2. 代表的な登録ポート番号
ポート番号 | TCP/UDP | サービス名 | 備考
-- | -- | -- | --
1521 | TCP |   | Oracleリスナー（デフォルト）
8080 | TCP |   | ApacheTomcat（デフォルト）

### 3. HTTP/HTTPS 通信
ブラウザでウェブページを開く際に、ポート番号を指定することができる  
`https://www.google.com/` をブラウザで開く際に `https://www.google.com:443` を指定しても同じページが開かれるが、`https://www.google.com:22` とするとページが開かれない

これは、ポート番号443はHTTPSのポート番号であり、ポート番号22はSSHのポート番号であるため  
通常、ブラウザでポート番号を指定しないのは、HTTPがデフォルトでポート番号80、HTTPSがデフォルトでポート番号443を使用するため  

### 4. データベースへの接続
データベースに接続する際に、指定しているポート番号  

| DBMS       | PORT |
| ---------- | ---- |
| MySQL      | 3306 |
| PostgreSQL | 5432 |

```console
# PostgreSQL
$ brew services start postgresql
$ lsof -i -P | head -1; lsof -i -P | grep LISTEN | grep postgres
COMMAND   PID  USER    FD  TYPE             DEVICE SIZE/OFF  NODE NAME
postgres  3683 xxxx    7u  IPv6 xxxxxxxxxxxxxxxxxx      0t0  TCP localhost:5432 (LISTEN)
postgres  3683 xxxx    8u  IPv4 xxxxxxxxxxxxxxxxxx      0t0  TCP localhost:5432 (LISTEN)
$ brew services stop postgresql

# MySQL
$ mysql.server start
$ lsof -i -P | head -1; lsof -i -P | grep LISTEN | grep mysql
COMMAND   PID  USER   FD   TYPE             DEVICE SIZE/OFF  NODE NAME
mysqld    3944 xxxx   25u  IPv4 xxxxxxxxxxxxxxxxxx      0t0  TCP localhost:3306 (LISTEN)
$ mysql.server stop
```

### 5. ポート番号の確認
自分が使用しているパソコンで使用しているポート番号とそのポート番号を動かしているプログラムを確認する方法

```console
$ lsof -i -P | head -1; lsof -i -P | grep LISTEN
COMMAND   PID  USER   FD   TYPE             DEVICE SIZE/OFF  NODE NAME
Google    1234 xxxx   30u  IPv4 xxxxxxxxxxxxxxxxxx      0t0  TCP localhost:443 (LISTEN)
```
