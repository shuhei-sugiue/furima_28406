# README

# テーブル設計

## users テーブル

| Colum            | Type     | Options      |
| ---------------- | -------- | ------------ |
| nickname         | string   | null: false  |
| email            | string   | null: false  |
| password         | string   | null: false  |
| last_name        | string   | null: false  |
| first_name       | string   | null: false  |
| last_name_kana   | string   | null: false  |
| first_name_kana  | string   | null: false  |
| birthday         | date     | null: false  |

### Association

- has_many :items
- has_many :purchasers

## items テーブル

| Colum               | Type       | Options      |
| ------------------- | ---------- | ------------ |
| name                | text       | null: false  |
| description         | text       | null: false  |
| price               | integer    | null: false  |
| categories_id       | integer    | null: false  |
| state_id            | integer    | null: false  |
| charge_id           | integer    | null: false  |
| shipper_id          | integer    | null: false  |
| ship_date_id        | integer    | null: false  |
| user                | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :purchaser

## purchasers テーブル

| user    | references | null: false, foreign_key: true|
| item    | references | null: false, foreign_key: true|

### Association

belongs_to :user
belongs_to :item
has_one :address


## address テーブル

| Colum             | Type       | Options      |
| ----------------- | ---------- | ------------ |
| zip_code          | string     | null: false |
| province          | string     | null: false  |
| municipal         | string     | null: false  |
| street_number     | string     | null: false  |
| building          | string     |              |
| telephone         | string     | null: false  |
| purchaser         | references | null: false, foreign_key: true|

### Association
belongs_to :purchaser

is README would normally document whatever steps are necessary to get the
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
