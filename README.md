## usersテーブル

| Column              | Type   | Options                     |
|--------------------|---------|-----------------------------|
| id                 | integer | primary key, auto_increment |
| nickname           | string  | null: false, unique: true   |
| email              | string  | null: false, unique: true   |
| encrypted_password | string  | null: false                 |
| first_name         | string  | null: false                 |
| last_name          | string  | null: false                 |
| first_name_kana    | string  | null: false                 |
| last_name_kana     | string  | null: false                 |
| birth_date         | date    | null: false                 |

## itemsテーブル

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| id              | integer    | primary key, auto_increment    |
| goods_image     | string     | null: false                    |
| goods_name      | string     | null: false                    |
| goods_describe  | text       | null: false                    |
| goods_category  | string     | null: false                    |
| goods_condition | string     | null: false                    |
| delivery_charge | string     | null: false                    |
| delivery_region | string     | null: false                    |
| delivery_day    | string     | null: false                    |
| price           | text       | null: false                    |
| user            | references | null: false, foreign_key: true |

## ordersテーブル

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| id     | integer    | primary key, auto_increment    |
| goods  | text       | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |