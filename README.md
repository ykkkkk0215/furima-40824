## usersテーブル

| Column              | Type    | Options                     |
|---------------------|---------|-----------------------------|
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

## itemsテーブル

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| item_name          | string     | null: false                    |
| item_describe      | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| delivery_region_id | integer    | null: false                    |
| delivery_day_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### association
- belongs_to :user
- has_one :order

## ordersテーブル

| Column  | Type       | Options                        |
|---------|------------|--------------------------------|
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### association
- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| post_code          | string     | null: false                    |
| delivery_region_id | integer    | null: false                    |
| city               | string     | null: false                    |
| address1           | string     | null: false                    |
| address2           | string     |                                |
| phone              | string     | null: false                    |
| order              | references | null: false, foreign_key: true |

### association
- belongs_to :order