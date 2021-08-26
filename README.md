# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| first_name         | string  | null: false |
| last_name	         | string  | null: false |
| first_kana         | string  | null: false |
| last_kana          | string  | null: false |
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_day          | integer | null: false |

### Association
- has_one :mailing address,
- has_many :items,
- has_many :order history,


## items テーブル

| Column                  | Type       | Options                        |
| ----------------------- | -----------| ------------------------------ |
| name	                  | string     | null: false                    |
| image                   |	text       | null: false, foreign_key: true |
| price	                  | integer    | null: false                    |
| seller                  |	references | null: false, foreign_key: true |
| category                |	references | null: false, foreign_key: true |
| item_condition          |	integer    | null: false                    |
| item-postage            | string     | null: false                    |
| shipping area           | string     | null: false                    |
| estimated shipping date | date       | null: false                    |

### Association
- belongs_to :user,
- has_one :order history,
- belongs_to :mailing address,


## order history テーブル
| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| buyer          | string | null: false |
| purchased item | string | null: false |

### Association
- belongs_to :users,
- belongs_to :items,
- belongs_to :mailing address,


## mailing address テーブル
| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| post_code	    | string | null: false |
| prefecture    |	string | null: false | 
| city	        | string | null: false |
| house_number  |	string | null: false |
| building_name	| string |             |
| phone_number	| string | null: false |

### Association
- belongs_to :user,
- belongs_to :order history,
- belongs_to :mailing address,