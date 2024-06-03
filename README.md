## usersテーブル

| Column              | Type    | Options                     |
|---------------------|---------|-----------------------------|
| id                  | integer | primary key, auto_increment |
| nickname            | string  | null: false                 |
| email               | string  | null: false, unique: true   |
| encrypted_password  | string  | null: false                 |
| first_name          | string  | null: false                 |
| last_name           | string  | null: false                 |
| first_name_kana     | string  | null: false                 |
| last_name_kana      | string  | null: false                 |
| birth_date          | date    | null: false                 |

### association
- has_many :items
- has_many :orders
- has_many :addresses

## itemsテーブル

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| id              | integer    | primary key, auto_increment    |
| item_name       | string     | null: false                    |
| item_describe   | text       | null: false                    |
| item_category   | integer    | null: false                    |
| item_condition  | integer    | null: false                    |
| delivery_charge | integer    | null: false                    |
| delivery_region | integer    | null: false                    |
| delivery_day    | integer    | null: false                    |
| price           | integer    | null: false                    |
| user_id         | integer    | null: false, foreign_key: true |

### association
- belongs_to :user
- has_many :orders

## ordersテーブル

| Column  | Type    | Options                        |
|---------|---------|--------------------------------|
| id      | integer | primary key, auto_increment    |
| item_id | integer | null: false, foreign_key: true |
| user_id | integer | null: false, foreign_key: true |

### association
- belongs_to :user
- belongs_to :item

## addressesテーブル

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| id           | integer    | primary key, auto_increment    |
| post_code    | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| address1     | string     | null: false                    |
| address2     | string     |                                |
| phone        | string     | null: false                    |
| order_id     | integer    | null: false, foreign_key: true |

### association
- belongs_to :user
- belongs_to :order