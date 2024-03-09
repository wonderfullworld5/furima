# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| kana_last_name     | string | null: false |
| kana_first_name    | string | null: false |
| birth              | date   | null: false |


### Association
- has_many :items
- has_many :records

## items テーブル

| Column             | Type      | Options     |
| ------------------ | ------    | ----------- |
| description        | string    | null: false |
| detail             | text      | null: false |
| category_id        | integer   | null: false |
| postage_id         | integer   | null: false |
| area_id            | integer   | null: false |
| date_id            | integer   | null: false |
| price              | integer   | null: false |
| user               | references| null: false, foreign_key: true| 


### Association

- belongs_to :user
- has_one :record

## records テーブル

| Column             | Type      | Options     |
| ------------------ | ------    | ----------- |
| user               | references| null: false, foreign_key: true| 
| item               | references| null: false, foreign_key: true|


### Association

- belongs_to :user
- belongs_to :item
- has_one :ship

## ships テーブル

| Column             | Type      | Options     |
| ------------------ | ------    | ----------- |
| record             | references| null: false, foreign_key: true|
| postcode           | string    | null: false |
| area_id            | integer   | null: false |
| city               | string    | null: false |
| street             | string    | null: false |
| building           | string    |             |
| phone              | string    | null: false |


### Association

- belongs_to :record


