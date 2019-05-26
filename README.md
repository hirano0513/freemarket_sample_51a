# README

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|profile|text|

### Association
- has_many :comments
- has_many :items
- belongs_to :credit_card
- belongs_to :personal


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|
|price|integer|null: false|
|size|integer|null: false, default: 0|
|item_status|integer|null: false, default: 0|
|sales_status|integer|null: false, default: 0|
|like|integer|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|

### Association
- has_many :comments
- has_many :images
- has_many :items_categories
- has_many :categories, through: :items_categories
- belongs_to :user
- belongs_to :shipment
- belongs_to :brand



## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## personalsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|kana_name|string|null: false|
|postal_code|integer|null: false|
|prefectures|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|
|birth_day|integer|null: false|
|phone_number|integer|unique: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to_active_hash :prefectures


## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|unique: true|
|year|integer|
|month|integer|
|security_code|integer|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user


## shipmentsテーブル
|Column|Type|Options|
|------|----|-------|
|cost_payer|integer|null: false, default: 0|
|method|integer|null: false, default: 0|
|days|sinteger|null: false, default: 0|
|item_id|references|null: false, foreign_key: true|
|prefectures|integer|null: false|

### Association
- belongs_to_active_hash :prefectures
- belongs_to :item


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|unique: true|

### Association
- has_many :items


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items_categories
- has_many :items, through: :items_categories


## items_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :category