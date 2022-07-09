# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |

### Association

- has_many :items
- has_many :comments
- has_many :orders

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product_name        | string     | null: false                    |
| description         | text       | null: false                    |
| condition_id        | integer    | null: false                    |
| pay_for_shipping_id | integer    | null: false                    |
| ken_name_id         | integer    | null: false                    |
| shipping_days_id    | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one  :order
- has_many :item_tags
- has_many :tags, through: :photo_tags

## tags テーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :item_tags
- has_many :items, through: :item_tags

## item_tags テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| tag_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :tag

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping_info

## shipping_info テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| zip             | string     | null: false                    |
| ken_name_id     | integer    | null: false                    |
| city_name       | string     | null: false                    |
| address         | string     | null: false                    |
| building        | string     |                                |
| tel             | string     | null: false                    |
| order           | references | null: false, foreign_key: true |

### Association

- belongs_to :order