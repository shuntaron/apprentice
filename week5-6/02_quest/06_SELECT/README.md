## データ検索

### 1. 環境構築
```console
$ apt-get update
$ apt-get install git
$ git clone https://github.com/datacharmer/test_db.git
$ cd test_db
$ mysql -u root -p < employees.sql
Enter password: 
INFO
CREATING DATABASE STRUCTURE
INFO
storage engine: InnoDB
INFO
LOADING departments
INFO
LOADING employees
INFO
LOADING dept_emp
INFO
LOADING dept_manager
INFO
LOADING titles
INFO
LOADING salaries
data_load_time_diff
00:01:38
```

### 2. 全カラムの取得


### 3. カラムの選択


### 4. カラム名の別名


### 5. 重複行の削除

