# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|mail|string|null: false|
|password|string|null: false|
|family_name_kanji|string|null: false|
|first_name_kanji|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday_year|string|null: false|
|birthday_month|string|null: false|
|birthday_date|string|null: false|

### Association
- has_many :comments
- has_many :items, dependent: :destroy
- has_many :credit_cards, dependent: :destroy
- has_one :address, dependent: :destroy



## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item



## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|description|string|null: false|
|size|string||
|status|string|null: false|
|charge|string|null: false|
|delivery_method|string|null: false|
|send_date|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|

### Association
- has_many :images, dependent: :destroy
- has_many :comments, dependent: :destroy
- belongs_to :user
- belongs_to :category



## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item



## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|major|string|null: false|
|medium|string|null: false|
|small|string|null: false|

### Association
- has_many :items




## addressテーブル
|Column|Type|Options|
|------|----|-------|
|zip_code|string||
|prefecture|string||
|city|string||
|address|string||
|building|string||
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user




## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|number|integer||
|limit|integer||
|security_code|integer||
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user




## snsテーブル
|Column|Type|Options|
|------|----|-------|
|facebook|string||
|google|string||
|mail|string||

### Association




* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

