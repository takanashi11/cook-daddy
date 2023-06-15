# アプリケーション名
## Cook Daddy

# アプリケーション概要
## レシピを投稿し合い、料理のレパートリーを増やすことで、毎日のメニューを考えるのが楽に、楽しくなります。

# URL
## https://cook-daddy.onrender.com
##

# テスト用アカウント
## Basic認証
### ユーザー名 ：admin
### パスワード　: 2222
## テストアカウント
### メールアドレス： test@test
### パスワード：aaa111

# 利用方法
### テストアカウントでログイン→トップページ上部右上のボタンから投稿ボタン押下→投稿情報入力→レシピ投稿
### →トップページから投稿詳細、編集、削除→トップページのボタンから、ランダムに投稿が出力されるガチャ機能
### →確認後、ログアウト処理をお願いします。

# アプリケーションを作成した背景
### 20～30代の料理を作りたい気持ちはあるが、毎日メニューを考えるのが大変。レシピサイトを見ても何を作るか迷ってしまう### という方に向けて作成したアプリケーションです。

# 洗い出した要件
## https://docs.google.com/spreadsheets/d/1cmnsbDz4bA7tPEX87xQmMZd3gted2PaXjb1GeS7SKQU/edit#gid=982722306

# 実装予定の機能
### 検索機能

# データベース設計
## [![Image from Gyazo](https://i.gyazo.com/a503ec46f9d945f80a47c284ecefd4fb.png)](https://gyazo.com/a503ec46f9d945f80a47c284ecefd4fb)

# 画面遷移図
##[![Image from Gyazo](https://i.gyazo.com/4bed1095c3cdb612acadbeb456ed7a2f.png)](https://gyazo.com/4bed1095c3cdb612acadbeb456ed7a2f)

# 開発環境
### Ruby on Rails、Ruby、JavaScript、Bootstrap、Visual Studio Code

# 工夫したポイント
### いかにアプリを使っていただく方に、料理を楽しんでいただけるかをコンセプトに開発を行いました。
### アプリをより良いものにしていくために、JavaScript、Bootstrapを追加して実装しました。



# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| nickname           | string | null: false             |
| email              | string | null: false unique: true|
| encrypted_password | string | null: false             |
| surname            | string | null: false             |
| name               | string | null: false             |
| katakana_surname   | string | null: false             |
| katakana_name      | string | null: false             |
| birth              | date   | null: false             |

### Association

- has_many :recipes
- has_many :comments


## recipes テーブル

| Column           | Type       | Options                        |
| ------           | ------     | -----------                    |
| recipe_title     | string     | null: false                    |
| recipe_material  | text       | null: false                    |
| recipe_text      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments


## comments テーブル

| Column        | Type       | Options                      |
| ------        | ---------- | -----------                  |
| comment_text  | string     | null: false                  |
| user          | references | null: false,foreign_key: true|
| recipe        | references | null: false,foreign_key: true|


### Association

- belongs_to :user
- belongs_to :recipe
