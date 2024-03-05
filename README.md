# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| address            | text   | null: false |
| phone              | text   | null: false |

### Association


## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| image              | string | null: false |
| description        | string | null: false |
| detail             | string | null: false |
| category           | string | null: false |
| postage            | string | null: false |
| postage            | string | null: false |
| area               | string | null: false |
| days               | string | null: false |
| price              | text   | null: false |

### Association

- has_one : records
- has belong : to : items

## records テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postcode           | string | null: false |
| area               | string | null: false |
| city               | text   | null: false |
| street             | text   | null: false |
| building           | text   | null: option|
| phone              | text   | null: false |


### Association

- has_one : ships

## ships テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postcode           | string | null: false |
| area               | string | null: false |
| city               | text   | null: false |
| street             | text   | null: false |
| building           | text   | null: option|
| phone              | text   | null: false |


### Association

- belongs_to :records
