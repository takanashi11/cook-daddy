# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

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
