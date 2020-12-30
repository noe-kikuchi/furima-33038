# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| nickname       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| lastname       | string | null: false |
| firstname      | string | null: false |
| lastname_kana  | string | null: false |
| firstname_kana | string | null: false |
| birth_date1    | string | null: false |
| birth_date2    | string | null: false |
| birth_date3    | string | null: false |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column                | Type       | Options                       |
| --------------------- | ---------- | ----------------------------- |
| name                  | string     | null: false                   |
| image                 |            | null: false                   |
| info                  | text       | null: false                   |
| category              | string     | null: false                   |
| state                 | string     | null: false                   |
| delivery_fee          | string     | null: false                   |
| delivery_pretecture   | string     | null: false                   |
| feescheduled_delivery | string     | null: false                   |
| price                 | string     | null: false                   |
| user                  | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :buy

## buy テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| card number          | string     | null: false                    |
| expirationdate_month | string     | null: false                    |
| expirationdate_year  | string     | null: false                    |
| security_number      | string     | null: false                    |
| user                 | references | null: false, foreign_key: true |
| item                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :ship

## ships テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | string     | null: false                    |
| buy           | references | null: false, foreign_key: true |

