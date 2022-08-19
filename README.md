# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |

### Association

- has_many :items

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
| item                | references | null: true,  foreign_key: true  |

### Association

- has_one_attached :image
- belongs_to :user
- has_one :order
- has_many :item_relationships,
           class_name: 'Relationship',
           foreign_key: 'trade_item_id',
           dependent: :destroy,
           inverse_of: :item

- has_many :trad_item_relationships,
           class_name: 'Relationship',
           foreign_key: 'item_id',
           dependent: :destroy,
           inverse_of: :trade_item

## relationships テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item          | references | null: false, foreign_key: true |
| trade_item    | references | null: false, foreign_key: true |

### Association

- belongs_to :item, class_name: 'Item'
- belongs_to :trade_item, class_name: 'Item'
- has_one :order

## orders テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| relationship | references | null: false, foreign_key: true |

### Association

- belongs_to :relationship
- validates :relationship_id