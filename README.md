# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| first_name         | string              | null: false               |
| last_name          | string              | null: false               |
| first_name_kana    | string              | null: false               |
| last_name_kana     | string              | null: false               |
| birthday           | date                | null: false               |

### Association

- has_many :items
- has_many :purchases

## items table

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| title              | string     | null: false                    |
| item_info          | text       | null: false                    |
| item_tag           | integer    | null: false                    |
| item_condition     | integer    | null: false                    |
| invoice_city       | integer    | null: false                    |
| invoice_day        | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases table

| Column             | Type       | Options                        |
|--------------------|---------------------------------------------|
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :order

## orders table

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| postcode           | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | integer    | null: false                    |
| block              | integer    | null: false                    |
| building           | integer    | null: false                    |
| phone_number       | integer    | null: false                    |

### Association

- belongs_to :purchase
