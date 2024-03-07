# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| birth              | string | null: false |


### Association
- has_many :items
- has_one :record

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| description        | string | null: false |
| detail             | text   | null: false |
| category_id        | integer| null: false |
| postage_id         | integer| null: false |
| area_id            | integer| null: false |
| days_id            | integer| null: false |
| price              | integer| null: false |
| user_id            | integer| null: false |


### Association

- belongs_to :user
- has_one :record

## records テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user_id            | integer| null: false |
| item_id            | integer| null: false |




### Association

- belongs_to :user
- belongs_to :item

## ships テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| record_id          | integer| null: false |
| postcode           | string | null: false |
| area               | string | null: false |
| city               | string | null: false |
| street             | string | null: false |
| building           | string |             |
| phone              | string | null: false |


### Association

- belongs_to :record

