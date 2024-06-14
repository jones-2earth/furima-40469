# DB設計

## users テーブル
| Column             | Type   | Options                               |
| ------------------ | ------ | --------------------------------------|
| nickname           | string | null: false                           |
| email              | string | null: false, unique: true, index: true|
| encrypted_password | string | null: false                           |
| first_name         | string | null: false                           |
| last_name          | string | null: false                           |
| first_kana         | string | null: false                           |
| last_kana          | string | null: false                           |
| birthday           | data   | null: false                           |

### Association
- belongs_to :prefecture
- has_one :orders
- has_many :items

## sending_destinations テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null:false                     |
| house_number    | string     | null:false                     |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| orders          | references | null: false, foreign_key: true |

### Association
- belongs_to :order

## items テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| price              | integer    | null: false                    |
| item_description   | text       |                                |
| item_condition_id  | integer    | null: false, foreign_key: true |
| postage_payer_id   | integer    | null: false, foreign_key: true |
| preparation_day_id | integer    | null: false, foreign_key: true |
| prefecture_id      | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## orders テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key:true  |
| item            | references | null: false, foreign_key:true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one :sending_destination
