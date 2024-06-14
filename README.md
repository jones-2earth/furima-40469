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
- has_one :sending_destination, dependent: :destroy
- has_many :buyer_items, foreign_key: "buyer_id", class_name: "items"
- has_many :seller_items, foreign_key: "seller_id", class_name: "items"
- has_many :comments

## sending_destinations テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| prefecture      | string     | null: false                    |
| city            | string     | null:false                     |
| house_number    | string     | null:false                     |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## comments テーブル
| Column      | Type       | Options                            |
| ----------- | ---------- | ---------------------------------- |
| body        | text       |                                    |
| user        | references | null: false, foreign_key: true     |
| item        | references | null:false, foreign_key: true      |

### Association
- belongs_to :user
- belongs_to :item

## items テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| price              | integer    | null: false                    |
| item_description   | string     |                                |
| item_condition_id  | integer    | null: false, foreign_key: true |
| postage_payer_id   | integer    | null: false, foreign_key: true |
| preparation_day_id | integer    | null: false, foreign_key: true |
| prefecture         | string     | null: false                    |
| user               | references | foreign_key: true              |
| category           | references | null: false, foreign_key: true |
| brand              | integer    | foreign_key: true              |

### Association
- has_many :item_images, dependent: :destroy
- has_many :comments, dependent: :destroy
- belongs_to :category
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :preparation_day
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :brand

## categories テーブル
| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| name        | string     | null: false |
| ancestry    | string     | null: false |

### Association
- has_many :items

## item_images テーブル
| Column      | Type       | Options                            |
| ----------- | ---------- | ---------------------------------- |
| image       | text       | null: false                        |
| item        | references | null:false, foreign_key: true      |

### Association
- belongs_to :item