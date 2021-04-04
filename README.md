# アプリケーション名
Doggle

# アプリケーション概要
犬を飼っている人同士を結ぶ
コミュニケーションツール

# 本番環境(デプロイ先テストアカウント＆ID)
  接続先： https://doogle-28664.herokuapp.com/
  認証ID/Pass:  admin / 2222<br>
  
  テスト用アカウント:<br>
        メールアドレス: sample@sample.com<br>
        パスワード: sample2<br>

  Githubリポジトリ
    https://github.com/ZYO-BAIKER/doggle-28664

# 制作背景(意図)
  人と人を繋ぐSNSは発展して、多くの人々とコミュニケーションを図れる世界になった。
  私は、実家で犬を２匹飼っている。二人とも非常に愛らしいが友人と呼べる犬友がいない。
  当時の私は散歩していても、同じように犬の散歩している他人に声をかけるのが億劫だった。
  そこで、このアプリで近所の犬を飼っている人を探して事前にネットでコミュニケーションを図れば声をかけて、
  愛犬たちに犬友を作ってあげようと思いました。

# DEMO(gifで動画や写真を貼って、ビューのイメージを掴んでもらいます)
・トップページ
https://gyazo.com/b0bd9af9442237ef8419732e6ac417d5

・非同期通信のコメント動画
https://gyazo.com/bbfafdab20d69fbf47cc3af5a1002dff

・検索結果動画
https://gyazo.com/985ee411a73783b8893615efe43d94f8

・カルーセル
https://gyazo.com/562c319f3f3601ef01b90af7a645feea

# 工夫したポイント
  HTML・CSSを一から自分で考えて作成したのは初めてだったので、最初はそこに戸惑いました。<br>
  お手本にあるようなおしゃれなサイトを作成するには、まだ技術が追いついていないので、Canvaを使いロゴだけでも華やかにしました。<br>
  また、検索機能に様々な条件を付与するのに、ransackを用いましたが、userテーブルとdogsテーブルからそれぞれのカラムから検索させて出力させるのに苦労しました。<br>
  
# 使用技術(開発環境)
  Ruby / Ruby on Rails / MySQL / GitHub / Heroku / Visual Studio Code / Trello/Java script / AWS

# 実装予定の内容
  ・コメント機能とは別に、twitterのように特定のユーザーにダイレクトメッセージを送信できるようにする<br>
  ・このアプリを多くのユーザーに知ってもらう為に、例えばtwitterとuserアカウント連携して、愛犬を投稿するとtwitterにも自動で投稿されるようにしたい<br>
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
