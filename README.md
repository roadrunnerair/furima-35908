# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false,              |
| last_name	         | string  | null: false,              |
| first_kana         | string  | null: false,              |
| last_kana          | string  | null: false,              |
| birth_day          | date    | null: false               |

### Association
- has_many :items
- has_many :order_histories


## items テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| name	                     | string     | null: false,                   |
| price	                     | integer    | null: false                    |
| item_description           | text       | null: false                    |
| user                       | references | null: false, foreign_key: true |
| category_id                | integer    | null: false,                   |
| item_condition_id          | integer    | null: false,                   |
| item_postage_id            | integer    | null: false,                   |
| prefecture_id              | integer    | null: false,                   |
| estimated_shipping_date_id | integer    | null: false,                   |

### Association
- belongs_to :user
- has_one :order_history
- belongs_to_active_hash :category_id
- belongs_to_active_hash :item_condition_id
- belongs_to_active_hash :item_postage_id
- belongs_to_active_hash :shipping_area_id
- belongs_to_active_hash :estimated_shipping_date_id


## order_histories テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :mailing_address


## mailing_addresses テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code	  | string     | null: false                    |
| prefecture_id |	integer    | null: false                    | 
| city	        | string     | null: false                    |
| house_number  |	string     | null: false                    |
| building_name	| string     |                                |
| phone_number	| string     | null: false                    |
| order_history | references | null: false, foreign_key: true |

### Association
- belongs_to :order_history