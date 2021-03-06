# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

---

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
|birthday_year|integer|null: false|
|birthday_month|integer|null: false|
|birthday_day|integer|null: false|
|phone_number|integer||

### Association
- has_many :comments
- has_many :items, dependent: :destroy
- has_one :credit_card, dependent: :destroy
- has_one :address, dependent: :destroy
- has_many :sns_credentials, dependent: :destroy



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
|parent_category|string|null: false|
|child_category|string|null: false|
|grandchild_category|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|prefecture_id|integer|null: false, foreign_key: true|

### Association
- has_many :images, dependent: :destroy
- has_many :comments, dependent: :destroy
- belongs_to :user



## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item



## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||

### Association
- has_ancestry




## addressテーブル
|Column|Type|Options|
|------|----|-------|
|zip_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string||
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user




## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|number|integer||
|limit_month|integer||
|limit_year|integer||
|security_code|integer||
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user




## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|uid|string|null: false|
|provider|string|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

---

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

