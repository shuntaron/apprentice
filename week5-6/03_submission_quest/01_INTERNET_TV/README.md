# インターネットTV

## 概要
[ABEMA](https://abema.tv/)のような「インターネットTVサービス」のデータベース設計を行う  

## 仕様
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

## 例(シリーズモノ)
  - 番組：鬼滅の刃
  - シーズン：1
  - エピソード：1話、2話、...、26話

## ステップ1
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

### エンティティ
- チャンネル
- 番組
- ジャンル
- シーズン
- エピソード

### ER図
```mermaid
erDiagram
  Channel ||--o{ Program: ""
  Program ||--o{ ProgramGenre: ""
  Program ||--o{ ProgramEpisode: ""
  Season  ||--o{ Episode: ""
  Episode ||--o{ ProgramEpisode: ""
  Genre   ||--o{ ProgramGenre: ""

  Channel {
    id              bigint(20)    PK
    name            varchar(255)    
  }

  Program {
    id              bigint(20)    PK
    channel_id      bigint(20)    FK
    episode_id      bigint(20)    FK
    genre_id        bigint(20)    FK
    title           varchar(255)    
    detail          text            
    start_time      datetime        
    end_time        datetime        
  }

  Season {
    id              bigint(20)    PK
    number          bigint(20)      
    name            varchar(255)    
  }

  ProgramEpisode {
    id              bigint(20)    PK
    program_id      bigint(20)    FK
    episode_id      bigint(20)    FK
    view_count      bigint(20)      
  }

  ProgramGenre {
    id              bigint(20)    PK
    program_id      bigint(20)    FK
    genre_id        bigint(20)    FK
  }

  Episode {
    id              bigint(20)    PK
    season_id       bigint(20)    FK
    number          bigint(20)      
    title           varchar(255)    
    detail          text            
    duration        time            
    view_count      bigint(20)      
  }

  Genre {
    id              bigint(20)    PK
    name            varchar(255)    
  }
```

### テーブル定義
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
| episode_id | bigint(20)   | YES  |         |         |                |
| genre_id   | bigint(20)   | YES  |         |         |                |
| title      | varchar(255) |      |         |         |                |
| detail     | text         |      |         |         |                |
| start_time | datetime     |      |         |         |                |
| end_time   | datetime     |      |         |         |                |

- 外部キー制約： channel_id に対して、 channels テーブルの id カラムから設定
- 外部キー制約： episode_id に対して、 episodes テーブルの id カラムから設定
- 外部キー制約： genre_id に対して、 genres テーブルの id カラムから設定

### [seasons テーブル]
テーブル名： seasons
| COLUMN | DATA TYPE    | NULL | KEY     | DEFAULT | AUTO INCREMENT |
| ------ | ------------ | ---- | ------- | ------- | -------------- |
| id     | bigint(20)   |      | PRIMARY |         | YES            |
| number | bigint(20)   |      |         |         |                |
| name   | varchar(255) |      |         |         |                |

### [program - episodes テーブル]
テーブル名： program_episodes
| COLUMN     | DATA TYPE  | NULL | KEY     | DEFAULT | AUTO INCREMENT |
| ---------- | ---------- | ---- | ------- | ------- | -------------- |
| id         | bigint(20) |      | PRIMARY |         | YES            |
| program_id | bigint(20) | YES  |         |         |                |
| episode_id | bigint(20) | YES  |         |         |                |
| view_count | bigint(20) |      |         | 0       |                |

- 外部キー制約： program_id に対して、 programs テーブルの id カラムから設定
- 外部キー制約： episode_id に対して、 episodes テーブルの id カラムから設定

### [program - genres テーブル]
テーブル名： program_genres
| COLUMN     | DATA TYPE  | NULL | KEY     | DEFAULT | AUTO INCREMENT |
| ---------- | ---------- | ---- | ------- | ------- | -------------- |
| id         | bigint(20) |      | PRIMARY |         | YES            |
| program_id | bigint(20) | YES  |         |         |                |
| genre_id  | bigint(20) | YES  |         |         |                |

- 外部キー制約： program_id に対して、 programs テーブルの id カラムから設定
- 外部キー制約： genres_id に対して、 genres テーブルの id カラムから設定

### [episodes テーブル]
テーブル名： episodes
| COLUMN     | DATA TYPE    | NULL | KEY     | DEFAULT | AUTO INCREMENT |
| ---------- | ------------ | ---- | ------- | ------- | -------------- |
| id         | bigint(20)   |      | PRIMARY |         | YES            |
| season_id  | bigint(20)   | YES  |         |         |                |
| number     | bigint(20)   | YES  |         |         |                |
| title      | varchar(255) |      |         |         |                |
| detail     | text         |      |         |         |                |
| duration   | time         |      |         |         |                |
| view_count | bigint(20)   |      |         | 0       |                |

- 外部キー制約： season_id に対して、 seasons テーブルの id カラムから設定

### [genres テーブル]
テーブル名： genres
| COLUMN | DATA TYPE    | NULL | KEY     | DEFAULT | AUTO INCREMENT |
| ------ | ------------ | ---- | ------- | ------- | -------------- |
| id     | bigint(20)   |      | PRIMARY |         | YES            |
| name   | varchar(255) |      |         |         |                |


## ステップ2
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

CREATE TABLE seasons (
  id              BIGINT(20)    NOT NULL PRIMARY KEY,
  number          BIGINT(20)    NOT NULL            ,
  name            VARCHAR(255)  NOT NULL             
);

CREATE TABLE genres (
  id              BIGINT(20)    NOT NULL PRIMARY KEY,
  name            VARCHAR(255)  NOT NULL             
);

CREATE TABLE episodes (
  id              BIGINT(20)    NOT NULL PRIMARY KEY,
  season_id       BIGINT(20)                        ,
  number          BIGINT(20)    NOT NULL            ,
  title           VARCHAR(255)  NOT NULL            ,
  detail          TEXT          NOT NULL            ,
  duration        TIME          NOT NULL            ,
  view_count      BIGINT(20)    NOT NULL            ,
  FOREIGN KEY     fk_season_id(season_id)            
  REFERENCES      seasons(id)                        
);

CREATE TABLE programs (
  id              BIGINT(20)    NOT NULL PRIMARY KEY,
  channel_id      BIGINT(20)                        ,
  episode_id      BIGINT(20)                        ,
  genre_id        BIGINT(20)    NOT NULL            ,
  title           VARCHAR(255)  NOT NULL            ,
  detail          TEXT          NOT NULL            ,
  start_time      DATETIME      NOT NULL            ,
  end_time        DATETIME      NOT NULL            ,
  FOREIGN KEY     fk_channel_id(channel_id)          
  REFERENCES      channels(id)                      ,
  FOREIGN KEY     fk_episode_id(episode_id)          
  REFERENCES      episodes(id)                      ,
  FOREIGN KEY     fk_genre_id(genre_id)              
  REFERENCES      genres(id)                         
);

CREATE TABLE program_episodes (
  id              BIGINT(20)    NOT NULL PRIMARY KEY,
  program_id      BIGINT(20)                        ,
  episode_id      BIGINT(20)                        ,
  view_count      BIGINT(20)    DEFAULT 0           ,
  FOREIGN KEY     fk_program_id(program_id)          
  REFERENCES      programs(id)                      ,
  FOREIGN KEY     fk_episode_id(episode_id)          
  REFERENCES      episodes(id)                       
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

3. サンプルデータ格納
```sql
-- channels テーブルのINSERT文
INSERT INTO channels (id, name)
VALUES
(1, "日本テレビ"),
(2, "テレビ朝日"),
(3, "TBSテレビ"),
(4, "フジテレビ"),
(5, "テレビ東京");

-- genres テーブルのINSERT文
INSERT INTO genres (id, name)
VALUES
(1, "バラエティ"),
(2, "ドラマ"),
(3, "ニュース"),
(4, "刑事もの"),
(5, "ドキュメンタリー");

-- seasons テーブルのINSERT文
INSERT INTO seasons (id, number, name)
VALUES
(1, 1, "春のシーズン"),
(2, 2, "夏のシーズン"),
(3, 3, "秋のシーズン"),
(4, 4, "冬のシーズン"),
(5, 5, "年末特番シーズン");

-- episodes テーブルのINSERT文
INSERT INTO episodes (id, season_id, number, title, detail, duration, view_count)
VALUES
(1, 1, 1, "感動のフィナーレ", "バラエティ番組Aの第2話。感動的な結末が待っています。", "01:30:00", 800),
(2, 2, 2, "衝撃の展開", "ドラマBの第2話。予想だにしない展開が繰り広げられます。", "02:00:00", 1200),
(3, 3, 3, "大笑いのハプニング", "バラエティ番組Cの第2話。予期せぬハプニングが笑いを誘います。", "01:30:00", 1000),
(4, 4, 4, "新たな謎解き", "ドラマDの第2話。前回の謎解きに続き、新たな謎が登場します。", "02:00:00", 1500),
(5, 5, 5, "緊急速報", "ニュース番組Eの第2話。最新のニュース速報をお伝えします。", "01:00:00", 600);

-- programs テーブルのINSERT文
INSERT INTO programs (id, channel_id, episode_id, genre_id, title, detail, start_time, end_time)
VALUES
(1, 1, 1, 1, "バラエティ番組A", "笑いあり、トークありのバラエティ番組", "2023-05-28 20:00:00", "2023-05-28 21:30:00"),
(2, 2, 2, 2, "ドラマB", "恋愛をテーマにした感動のドラマ", "2023-05-28 21:00:00", "2023-05-28 23:00:00"),
(3, 3, 3, 3, "バラエティ番組C", "有名人のゲストが登場するバラエティ番組", "2023-05-29 19:30:00", "2023-05-29 21:00:00"),
(4, 4, 4, 4, "ドラマD", "刑事が難事件を解決するドラマ", "2023-05-29 20:00:00", "2023-05-29 22:00:00"),
(5, 5, 5, 5, "ニュース番組E", "最新のニュースをお伝えする番組", "2023-05-29 18:00:00", "2023-05-29 19:00:00");

-- program_episodes テーブルのINSERT文
INSERT INTO program_episodes (id, program_id, episode_id, view_count)
VALUES
(1, 1, 1, 100),
(2, 2, 2, 200),
(3, 3, 3, 150),
(4, 4, 4, 120),
(5, 5, 5, 80);

-- program_genres テーブルのINSERT文
INSERT INTO program_genres (id, program_id, genre_id)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);
```

## ステップ3
以下のデータを抽出するクエリを作成する  

1. よく見られているエピソードを知りたいです。エピソード視聴数トップ3のエピソードタイトルと視聴数を取得してください
```sql
SELECT title, view_count
FROM episodes
ORDER BY view_count DESC
LIMIT 3;
+-----------------------------+------------+
| title                       | view_count |
+-----------------------------+------------+
| 新たな謎解き                |       1500 |
| 衝撃の展開                  |       1200 |
| 大笑いのハプニング          |       1000 |
+-----------------------------+------------+
3 rows in set (0.00 sec)
```

2. よく見られているエピソードの番組情報やシーズン情報も合わせて知りたいです。エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得してください
```sql
SELECT pg.title, s.number, e.number, e.title, e.view_count
FROM episodes e
INNER JOIN seasons s
ON e.season_id = s.id
INNER JOIN program_episodes pe
ON e.id = pe.episode_id
INNER JOIN programs pg
ON pe.program_id = pg.id
ORDER BY e.view_count DESC
LIMIT 3;
+------------------------+--------+--------+-----------------------------+------------+
| title                  | number | number | title                       | view_count |
+------------------------+--------+--------+-----------------------------+------------+
| ドラマD                |      4 |      4 | 新たな謎解き                |       1500 |
| ドラマB                |      2 |      2 | 衝撃の展開                  |       1200 |
| バラエティ番組C        |      3 |      3 | 大笑いのハプニング          |       1000 |
+------------------------+--------+--------+-----------------------------+------------+
```

3. 本日の番組表を表示するために、本日、どのチャンネルの、何時から、何の番組が放送されるのかを知りたいです。本日放送される全ての番組に対して、チャンネル名、放送開始時刻(日付+時間)、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を取得してください。なお、番組の開始時刻が本日のものを本日方法される番組とみなすものとします


4. ドラマというチャンネルがあったとして、ドラマのチャンネルの番組表を表示するために、本日から一週間分、何日の何時から何の番組が放送されるのかを知りたいです。ドラマのチャンネルに対して、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を本日から一週間分取得してください


5. (advanced) 直近一週間で最も見られた番組が知りたいです。直近一週間に放送された番組の中で、エピソード視聴数合計トップ2の番組に対して、番組タイトル、視聴数を取得してください
6. (advanced) ジャンルごとの番組の視聴数ランキングを知りたいです。番組の視聴数ランキングはエピソードの平均視聴数ランキングとします。ジャンルごとに視聴数トップの番組に対して、ジャンル名、番組タイトル、エピソード平均視聴数を取得してください。
