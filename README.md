# README

# アプリケーション名　
DOGGLE

# アプリケーション概要
犬を飼っている人同士を結ぶ
コミュニケーションツール

# web URL
https://doogle-28664.herokuapp.com/
# テスト用アカウント

# 利用方法

# 目指した課題解決
愛犬を散歩に連れても内気な人だと、同様に散歩している近隣住民に声をかけずらい。
近所でペットを飼っている人を探して、飼い主同士とペット同士が友達となれる。

# 洗い出した要件
・ユーザー管理機能
新規登録、編集、ログイン・ログアウト・退会（アカウント削除）が可能

・ペット紹介機能
名前、画像、紹介文、性別、動物の種類、住んでる地域を投稿できる。

・検索機能
都道府県・市町村区まで検索して近所の犬を飼っている人を探す

・コメント機能
ペット紹介画面にコメントを投稿できる。

・ダイレクトメッセージ機能
気になった人に会う約束などするためのチャット機能。

# 実装した機能についてのGIFと説明

# 実装予定の機能

# テーブル設計

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

