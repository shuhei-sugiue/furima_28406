# README

# テーブル設計

## users テーブル

| Colum     | Type     | Options      |
| --------- | -------- | ------------ |
| nickname  | string   | null: false  |
| email     | string   | null: false  |
| password  | string   | null: false  |
| name      | string   | null: false  |
| kanan_ame | string   | null: false  |
| birthday  | integer  | null: false  |

### Association

- has_many :items
- has_many :purchasers

## items テーブル

| Colum       | Type       | Options      |
| ----------- | ---------- | ------------ |
| price       | integer    | null: false  |
| categories  | string     | null: false  |
| state       | string     | null: false  |
| charge      | string     | null: false  |
| shipper     | string     | null: false  |
| ship_date   | integer    | null: false  |
| user_id     | references | null: false  |

### Association

- belongs_to :user
- has_one :purchaser

## purchasers テーブル

| user_id    | references | null: false  |
| item_id    | references | null: false  |

### Association

belongs_to :user
belongs_to :item
has_one :address


## addresses テーブル

| Colum             | Type       | Options      |
| ----------------- | ---------- | ------------ |
| ship_to           | integer    | null: false  |
| province          | string     | null: false  |
| municipal         | string     | null: false  |
| street_number     | string     | null: false  |
| building          | string     |              |
| telephone         | integer    | null: false  |
| purchaser_id      | references | null: false  |

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