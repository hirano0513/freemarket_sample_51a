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
|size|string|null: false|
|item_status|string|null: false|
|sales_status|string|null: false|
|like|integer|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|

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
|text|text|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## personalテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|postal_code|integer|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|
|birth_day|integer|null: false|
|phone_number|integer|unique: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user


## credit_cardテーブル
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
|fee|string|null: false|
|method|string|null: false|
|days|string|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|unique: ture|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item


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