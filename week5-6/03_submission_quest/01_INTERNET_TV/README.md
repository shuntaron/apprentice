# インターネットTV

## 概要
[ABEMA](https://abema.tv/)のような「インターネットTVサービス」のデータベース設計を行う  

## 仕様
<details open>

- 複数のチャンネルがある
- 各チャンネルに時間帯ごとに番組枠が設定されている
- 番組はシリーズモノと単発モノがある
- シリーズモノは1シーズンのものと複数シーズンのものがある
- シリーズモノには各エピソードが設定されている
- 再放送があり、番組が複数チャンネルの異なる時間帯で放映される場合がある
- 番組情報として、以下が画面上に表示される
  - タイトル
  - 番組詳細
  - ジャンル
- 各エピソード情報として、以下が画面上に表示される
  - シーズン数 (※単発エピソードの場合は表示されない)
  - エピソード数 (※単発エピソードの場合は表示されない)
  - タイトル
  - エピソード詳細
  - 動画時間
  - 公開日
  - 視聴数
- 各番組は1つ以上のジャンルに属する
- ジャンル情報として、以下が存在する
  - アニメ
  - 映画
  - ドラマ
  - ニュース
- KPIとして、チャンネルの番組枠のエピソード毎に視聴数を記録する
- 1つのエピソードは複数の異なるチャンネル及び番組枠で放送されることがあるため、属するチャンネルの番組枠毎の視聴数についても記録する

</details>

## 例(シリーズモノ)
  - 番組：鬼滅の刃
  - シーズン：1
  - エピソード：1話、2話、...、26話

## ステップ1
<details open>

データベース設計をする  
テーブルごとに以下を定義する
- テーブル名
- カラム名
- データ型
- NULL(NULL OK の場合のみ YES と記載)
- キー（キーが存在する場合、PRIMARY/INDEX のどちらかを記載）
- 初期値（ある場合のみ記載）
- AUTO INCREMENT（ある場合のみ YES と記載）
- 外部キー制約
- ユニークキー制約

以下のポイントを抑えること
- アプリケーションとして成立すること(プログラムを組んだ際に仕様を満たして動作すること)
- 正規化されていること

</details>


### エンティティ
<details open>

- チャンネル
- 番組
- ジャンル
- シーズン
- エピソード

</details>

### ER図

```mermaid
erDiagram
  Channel ||--o{ Program: ""
  Program ||--o{ Season: ""
  Program ||--o{ ProgramGenre: ""
  Season  ||--o{ Episode: ""
  Genre   ||--o{ ProgramGenre: ""

  Channel {
    id              bigint(20)    PK
    name            varchar(255)    
  }

  Program {
    id              bigint(20)    PK
    channel_id      bigint(20)    FK
    title           varchar(255)    
    detail          text            
    start_time      datetime        
    end_time        datetime        
  }

  Season {
    id              bigint(20)    PK
    program_id      bigint(20)    FK
    number          bigint(20)      
    name            varchar(255)    
  }

  Episode {
    id              bigint(20)    PK
    season_id       bigint(20)    FK
    number          bigint(20)      
    title           varchar(255)    
    detail          text            
    duration        time            
    release_date    date            
    view_count      bigint(20)      
  }

  Genre {
    id              bigint(20)    PK
    name            varchar(255)    
  }

  ProgramGenre {
    id              bigint(20)    PK
    program_id      bigint(20)    FK
    genre_id        bigint(20)    FK
  }
```

</details>

### テーブル定義
<details open>

### [channels テーブル]
テーブル名： channels
| COLUMN | DATA TYPE    | NULL | KEY     | DEFAULT | AUTO INCREMENT |
| ------ | ------------ | ---- | ------- | ------- | -------------- |
| id     | bigint(20)   |      | PRIMARY |         | YES            |
| name   | varchar(255) |      |         |         |                |

### [programs テーブル]
テーブル名： programs
| COLUMN     | DATA TYPE    | NULL | KEY     | DEFAULT | AUTO INCREMENT |
| ---------- | ------------ | ---- | ------- | ------- | -------------- |
| id         | bigint(20)   |      | PRIMARY |         | YES            |
| channel_id | bigint(20)   | YES  |         |         |                |
| title      | varchar(255) |      |         |         |                |
| detail     | text         |      |         |         |                |
| start_time | datetime     |      |         |         |                |
| end_time   | datetime     |      |         |         |                |

- 外部キー制約： channel_id に対して、 channels テーブルの id カラムから設定

### [seasons テーブル]
テーブル名： seasons
| COLUMN     | DATA TYPE    | NULL | KEY     | DEFAULT | AUTO INCREMENT |
| ---------- | ------------ | ---- | ------- | ------- | -------------- |
| id         | bigint(20)   |      | PRIMARY |         | YES            |
| program_id | bigint(20)   | YES  |         |         |                |
| number     | bigint(20)   | YES  |         |         |                |
| name       | varchar(255) | YES  |         |         |                |

- 外部キー制約： program_id に対して、 programs テーブルの id カラムから設定

### [episodes テーブル]
テーブル名： episodes
| COLUMN       | DATA TYPE    | NULL | KEY     | DEFAULT | AUTO INCREMENT |
| ------------ | ------------ | ---- | ------- | ------- | -------------- |
| id           | bigint(20)   |      | PRIMARY |         | YES            |
| season_id    | bigint(20)   | YES  |         |         |                |
| number       | bigint(20)   | YES  |         |         |                |
| title        | varchar(255) |      |         |         |                |
| detail       | text         |      |         |         |                |
| duration     | time         |      |         |         |                |
| release_date | date         |      |         |         |                |
| view_count   | bigint(20)   |      |         | 0       |                |

- 外部キー制約： season_id に対して、 seasons テーブルの id カラムから設定

### [genres テーブル]
テーブル名： genres
| COLUMN | DATA TYPE    | NULL | KEY     | DEFAULT | AUTO INCREMENT |
| ------ | ------------ | ---- | ------- | ------- | -------------- |
| id     | bigint(20)   |      | PRIMARY |         | YES            |
| name   | varchar(255) |      |         |         |                |

### [program - genres テーブル]
テーブル名： program_genres
| COLUMN     | DATA TYPE  | NULL | KEY     | DEFAULT | AUTO INCREMENT |
| ---------- | ---------- | ---- | ------- | ------- | -------------- |
| id         | bigint(20) |      | PRIMARY |         | YES            |
| program_id | bigint(20) | YES  |         |         |                |
| genre_id   | bigint(20) | YES  |         |         |                |

- 外部キー制約： program_id に対して、 programs テーブルの id カラムから設定
- 外部キー制約： genres_id に対して、 genres テーブルの id カラムから設定

</details>

## ステップ2
<details open>

実際にテーブルを構築し、データを格納する  
手順をドキュメント化する  

### 手順概要
1. データベース構築
2. ステップ1で設計したテーブルの構築
3. サンプルデータ格納

### 目的
- データを実際に入れることでステップ3でデータ抽出クエリを試せるようにする
- 手順をドキュメントにまとめることで、自身がやり直したい時にすぐやり直せるようにする
- 手順を人が同じように行えるようにまとめることで、ドキュメントコミュニケーション力を上げる

### 手順詳細
1. データベース構築
```sql
CREATE DATABASE internet_tv;
USE internet_tv;
```

2. ステップ1で設計したテーブルの構築
```sql
CREATE TABLE channels (
  id              BIGINT(20)    NOT NULL PRIMARY KEY,
  name            VARCHAR(255)  NOT NULL             
);

CREATE TABLE programs (
  id              BIGINT(20)    NOT NULL PRIMARY KEY,
  channel_id      BIGINT(20)                        ,
  title           VARCHAR(255)  NOT NULL            ,
  detail          TEXT          NOT NULL            ,
  start_time      DATETIME      NOT NULL            ,
  end_time        DATETIME      NOT NULL            ,
  FOREIGN KEY     fk_channel_id(channel_id)          
  REFERENCES      channels(id)                       
);

CREATE TABLE seasons (
  id              BIGINT(20)    NOT NULL PRIMARY KEY,
  program_id      BIGINT(20)                        ,
  number          BIGINT(20)                        ,
  name            VARCHAR(255)                      ,
  FOREIGN KEY     fk_program_id(program_id)          
  REFERENCES      programs(id)                       
);

CREATE TABLE episodes (
  id              BIGINT(20)    NOT NULL PRIMARY KEY,
  season_id       BIGINT(20)                        ,
  number          BIGINT(20)                        ,
  title           VARCHAR(255)  NOT NULL            ,
  detail          TEXT          NOT NULL            ,
  duration        TIME          NOT NULL            ,
  release_date    DATE          NOT NULL            ,
  view_count      BIGINT(20)    NOT NULL            ,
  FOREIGN KEY     fk_season_id(season_id)            
  REFERENCES      seasons(id)                        
);

CREATE TABLE genres (
  id              BIGINT(20)    NOT NULL PRIMARY KEY,
  name            VARCHAR(255)  NOT NULL             
);

CREATE TABLE program_genres (
  id              BIGINT(20)    NOT NULL PRIMARY KEY,
  program_id      BIGINT(20)                        ,
  genre_id        BIGINT(20)                        ,
  FOREIGN KEY     fk_program_id(program_id)          
  REFERENCES      programs(id)                      ,
  FOREIGN KEY     fk_genre_id(genre_id)              
  REFERENCES      genres(id)                         
);
```

</details>

3. サンプルデータ格納

```sql
-- channels table
INSERT INTO channels (id, name) VALUES
(1, 'TV Asahi'),
(2, 'Nippon TV'),
(3, 'TBS'),
(4, 'Fuji TV'),
(5, 'TV Tokyo'),
(6, 'Drama');

-- programs table
INSERT INTO programs (id, channel_id, title, detail, start_time, end_time) VALUES
(1, 1, 'News Program', 'Morning news', '2023-05-30 07:00:00', '2023-05-30 07:30:00'),
(2, 2, 'Drama', 'Latest episode of popular drama', '2023-05-30 21:00:00', '2023-05-30 22:00:00'),
(3, 3, 'Variety Show', 'Festival of laughter', '2023-05-31 18:00:00', '2023-05-31 19:00:00'),
(4, 4, 'Sports Coverage', 'Baseball game', '2023-06-01 14:00:00', '2023-06-01 17:00:00'),
(5, 5, 'Documentary Program', 'Wonders of the natural world', '2023-06-02 20:00:00', '2023-06-02 21:30:00'),
(6, 6, 'Drama 1', 'Drama 1', '2023-05-28 20:00:00', '2023-05-28 21:00:00'),
(7, 6, 'Drama 2', 'Drama 2', '2023-05-29 20:00:00', '2023-05-29 21:00:00'),
(8, 6, 'Drama 3', 'Drama 3', '2023-05-30 20:00:00', '2023-05-30 21:00:00'),
(9, 6, 'Drama 4', 'Drama 4', '2023-05-31 20:00:00', '2023-05-31 21:00:00'),
(10, 6, 'Drama 5', 'Drama 5', '2023-06-01 20:00:00', '2023-06-01 21:00:00'),
(11, 6, 'Drama 6', 'Drama 6', '2023-06-02 20:00:00', '2023-06-02 21:00:00'),
(12, 6, 'Drama 7', 'Drama 7', '2023-06-03 20:00:00', '2023-06-03 21:00:00');

-- seasons table
INSERT INTO seasons (id, program_id, number, name) VALUES
(1, 2, 1, 'Season 1'),
(2, 2, 2, 'Season 2'),
(3, 3, 1, 'Season 1'),
(4, 4, 3, 'Season 3'),
(5, 5, 1, 'Season 1'),
(6, 6, 1, 'Season 1'),
(7, 7, 1, 'Season 1'),
(8, 8, 1, 'Season 1'),
(9, 9, 1, 'Season 1'),
(10, 10, 1, 'Season 1'),
(11, 11, 1, 'Season 1'),
(12, 12, 1, 'Season 1');

-- episodes table
INSERT INTO episodes (id, season_id, number, title, detail, duration, release_date, view_count) VALUES
(1, 1, 1, 'First Episode', 'Episode 1 of the drama', '00:45:00', '2023-06-01', 100),
(2, 1, 2, 'Next Episode', 'Episode 2 of the drama', '00:45:00', '2023-06-08', 150),
(3, 2, 1, 'First Episode of Season 2', 'Episode 1 of the drama', '00:45:00', '2023-06-15', 80),
(4, 3, 1, 'Variety Show Episode 1', 'Compilation of funny moments', '00:30:00', '2023-05-31', 200),
(5, 4, 1, 'Sports Coverage Episode 1', 'Highlights of the game', '03:00:00', '2023-06-01', 120),
(6, 6, 1, 'Drama 1', 'Drama 1', '01:00:00', '2023-05-28', 101),
(7, 7, 2, 'Drama 2', 'Drama 2', '01:00:00', '2023-05-29', 102),
(8, 8, 3, 'Drama 3', 'Drama 3', '01:00:00', '2023-05-30', 103),
(9, 9, 4, 'Drama 4', 'Drama 4', '01:00:00', '2023-05-31', 104),
(10, 10, 5, 'Drama 5', 'Drama 5', '01:00:00', '2023-06-01', 105),
(11, 11, 6, 'Drama 6', 'Drama 6', '01:00:00', '2023-06-02', 106),
(12, 12, 7, 'Drama 7', 'Drama 7', '01:00:00', '2023-06-03', 107);

-- genres table
INSERT INTO genres (id, name) VALUES
(1, 'Drama'),
(2, 'Sports'),
(3, 'Variety'),
(4, 'News'),
(5, 'Documentary');

-- program_genres table
INSERT INTO program_genres (id, program_id, genre_id) VALUES
(1, 2, 1),
(2, 2, 3),
(3, 3, 4),
(4, 4, 2),
(5, 5, 5),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 1),
(12, 12, 1);
```

## ステップ3
<details open>

以下のデータを抽出するクエリを作成する  

1. よく見られているエピソードを知りたいです。エピソード視聴数トップ3のエピソードタイトルと視聴数を取得してください
```sql
  SELECT title, view_count
    FROM episodes
ORDER BY view_count DESC
   LIMIT 3;
```

2. よく見られているエピソードの番組情報やシーズン情報も合わせて知りたいです。エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得してください
```sql
    SELECT p.title, s.number, e.number, e.title, e.view_count
      FROM episodes e
INNER JOIN seasons  s
        ON e.season_id = s.id
INNER JOIN programs p
        ON s.program_id = p.id
  ORDER BY e.view_count DESC
     LIMIT 3;
```

3. 本日の番組表を表示するために、本日、どのチャンネルの、何時から、何の番組が放送されるのかを知りたいです。  
   本日放送される全ての番組に対して、以下を取得してください。
   なお、番組の開始時刻が本日のものを本日放送される番組とみなすものとします
    - チャンネル名
    - 放送開始時刻(日付+時間)
    - 放送終了時刻
    - シーズン数
    - エピソード数
    - エピソードタイトル
    - エピソード詳細

```sql
    SELECT c.name, p.start_time, p.end_time, s.number, e.number, e.title, e.detail
      FROM episodes e
INNER JOIN seasons  s
        ON e.season_id  = s.id
INNER JOIN programs p
        ON s.program_id = p.id
INNER JOIN channels c
        ON p.channel_id = c.id
     WHERE DATE_FORMAT(p.start_time, '%Y-%m-%d') = CURDATE();
```

4. ドラマというチャンネルがあったとして、ドラマのチャンネルの番組表を表示するために、本日から一週間分、何日の何時から何の番組が放送されるのかを知りたいです。
   ドラマのチャンネルに対して、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を本日から一週間分取得してください

```sql
    SELECT p.start_time, p.end_time, s.number, e.number, e.title, e.detail
      FROM episodes e
INNER JOIN seasons  s
        ON e.season_id  = s.id
INNER JOIN programs p
        ON s.program_id = p.id
INNER JOIN channels c
        ON p.channel_id = c.id
     WHERE c.name = 'Drama'
       AND DATE_FORMAT(p.start_time, '%Y-%m-%d')
   BETWEEN CURDATE()
       AND CURDATE() + INTERVAL 7 DAY;
```

5. (advanced) 直近一週間で最も見られた番組が知りたいです。直近一週間に放送された番組の中で、エピソード視聴数合計トップ2の番組に対して、番組タイトル、視聴数を取得してください
6. (advanced) ジャンルごとの番組の視聴数ランキングを知りたいです。番組の視聴数ランキングはエピソードの平均視聴数ランキングとします。ジャンルごとに視聴数トップの番組に対して、ジャンル名、番組タイトル、エピソード平均視聴数を取得してください。

</details>
