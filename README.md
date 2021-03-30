# アプリケーション名
Doggle

# アプリケーション概要
犬を飼っている人同士を結ぶ
コミュニケーションツール

# 本番環境(デプロイ先テストアカウント＆ID)
  接続先： https://doogle-28664.herokuapp.com/
  認証ID/Pass:  admin / 2222
  
  テスト用アカウント:      
        メールアドレス: s@s.com
        パスワード: sample2

  Githubリポジトリ
    https://github.com/ZYO-BAIKER/doggle-28664

# 制作背景(意図)
  これまで、学んできた内容の総復習として、作成する経験とスキルの定着のために挑戦しました。

# DEMO(gifで動画や写真を貼って、ビューのイメージを掴んでもらいます)
・トップページ
https://gyazo.com/b0bd9af9442237ef8419732e6ac417d5

・非同期通信のコメント動画
https://gyazo.com/bbfafdab20d69fbf47cc3af5a1002dff

・検索結果動画
https://gyazo.com/985ee411a73783b8893615efe43d94f8

# 工夫したポイント
  HTML・CSSを一から自分で考えて作成したのは初めてだったので、最初はそこに戸惑いました。<br>
  お手本にあるようなおしゃれなサイトを作成するには、まだ技術が追いついていないので、Canvaを使いロゴだけでも華やかにしました。<br>
  また、検索機能に様々な条件を付与するのに、ransackを用いましたが、userテーブルとdogsテーブルからそれぞれのカラムから検索させて出力させるのに苦労しました。<br>
  
# 使用技術(開発環境)
  Ruby / Ruby on Rails / MySQL / GitHub / Heroku / Visual Studio Code / Trello/Java script / AWS

# 実装予定の内容
  ・jQuaryを使って、各ページの見た目を飾る<br>
  ・dogの画像を複数投稿できるようにして、bxsliderで表示できるようにする<br>
  ・コメント機能とは別に、twitterのように特定のユーザーにダイレクトメッセージを送信できるようにする<br>
  ・Google Maps APIを用いて、ブラウザにマップを表示させ、ユーザーページに散歩コースのプロフィールを追加する<br>

# DB設計
## users テーブル

| Column        | Type    | Options     |
| --------------| ------- | ----------- |
| nickname      | string  | null: false |
| email         | string  | null: false |
| password      | string  | null: false |
| prefecture_id | integer | null: false |
| city          | string  | null: false |
| sex_id        | integer | null: false |
| age_id        | integer | null: false | 

- has_many :dogs
- has_many :comments
- has_many :messages

## dogs テーブル

| Column       |    Type    | Options     |
| -------------| ---------- | ----------- |
| name         | string     | null: false |
| sex_id       | integer    | null: false |
| type_id      | integer    | null: false |
| description  | text       | null: false |
| user         | references | null: false, foreign_key: true |

- belongs_to :user
- has_many :comments

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| dogs    | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :dog

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

- belongs_to :room
- belongs_to :user

