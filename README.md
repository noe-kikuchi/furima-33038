# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| lastname           | string  | null: false |
| firstname          | string  | null: false |
| lastname_kana      | string  | null: false |
| firstname_kana     | string  | null: false |
| birth_yyyy_id      | date    | null: false |
| birth_mm_id        | date    | null: false |
| birth_dd_id        | date    | null: false |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column                   | Type        | Options                        |
| ------------------------ | ----------- | ------------------------------ |
| name                     | string      | null: false                    |
| info                     | text        | null: false                    |
| category_id              | integer     | null: false                    |
| state_id                 | integer     | null: false                    |
| delivery_fee_id          | integer     | null: false                    |
| pretecture_id            | integer     | null: false                    |
| feescheduled_delivery_id | integer     | null: false                    |
| price                    | integer     | null: false                    |
| user                     | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## buy テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| item                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :ship

## ships テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| buy           | references | null: false, foreign_key: true |

