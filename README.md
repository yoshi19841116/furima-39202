# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users

|Column              |Type  |Options                  |
|------------------- | ---- | ----------------------- |
|name                |string|null: false              |
|email               |string|null: false, unique: true|
|encrypted_password  |string|null: false              |
|first_name          |string|null: false              |
|last_name           |string|null: false              |
|first_name_kana     |string|null: false              |
|last_name_kana      |string|null: false              |
|birth_date          |date  |null: false              |

### Association

- has_many :products
- has_many :purchases


## products

|Column                  |Type        |Options                       |
|----------------------- | ---------- | ---------------------------- |
|user                    |references  |null: false, foreign_key: true|
|product_name            |string      |null: false                   |
|description             |text        |null: false                   |
|category_id             |integer     |null: false                   |
|condition_id            |integer     |null: false                   |
|shipping_fee_burden_id  |integer     |null: false                   |
|shipping_form_id        |integer     |null: false                   |
|day_to_ship_id          |integer     |null: false                   |
|price                   |integer     |null: false                   |


### Association

- belongs_to :user
- belongs_to :purchases
- belongs_to_active_hash :categories
- belongs_to_active_hash :conditions
- belongs_to_active_hash :shipping_fee_burden
- belongs_to_active_hash :shipping_form
- belongs_to_active_hash :days_to_ship


## purchases

|Column                    |Type        |Options                       |
|------------------------- | ---------- | ---------------------------- |
|user                      |references  |null: false, foreign_key: true|
|product   	               |references	|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :product
- has_one :shipping_addresses

## shipping_addresses

|Column               |Type       |Options                       |
|-------------------- | ----------| -----------------------------|
|purchases            |references |null: false, foreign_key: true|
|postal_code          |string     |null: false                   |
|prefectures          |integer  	|null: false                   |
|city                 |string     |null: false                   |
|street               |string     |null: false                   |
|building             |string     |                              |
|phone_number         |string     |null: false                   |



### Association

- belongs_to :purchases
- belongs_to_active_hash :prefectures





