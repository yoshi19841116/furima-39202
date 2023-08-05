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
- has_many :shipping_addresses


## products

|Column                  |Type   |Options                       |
|----------------------- | ----- | ---------------------------- |
|product_name            |string |null: false                   |
|description             |text   |null: false                   |
|category_id             |integer|null: false                   |
|condition_id            |integer|null: false                   |
|shipping_fee_burden_id  |integer|null: false                   |
|shipping_form_id        |integer|null: false                   |
|days_to_ship_id         |integer|null: false                   |
|price                   |integer|null: false                   |

## categoriesテーブル (active_hash)

  id	name
  1	  category A
  2	  category B
  3	  category C
  ...	 ...

## conditionsテーブル (active_hash)

  id	name
  1	  new
  2	  used
  3	  refurbished
  ...	  ...

## shipping_fee_burdenテーブル (active_hash)
  id	name
  1	  buyer
  2	  seller
  ...	  ...
## shipping_formテーブル (active_hash)
  id	name
  1	  mail
  2	  courier
  ...	  ...

## days_to_shipテーブル (active_hash)
  id	name
  1	  1 day
  2	  2 days
  3	  3 days
  ...	  ...

### Association

- belongs_to :user
- belongs_to :shipping_address
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

## shipping_addresses

|Column               |Type       |Options                       |
|-------------------- | ----------| -----------------------------|
|postal_code          |string     |null: false                   |
|prefecture_id        |integer  	|null: false                   |
|city                 |string     |null: false                   |
|street               |string     |null: false                   |
|building             |string     |                              |
|phone_number         |string     |null: false                   |

## prefecturesテーブル (active_hash)

  id	name
  1	  北海道
  2	  青森県
  3	  岩手県
  ...	  ...

### Association

- belongs_to :user
- belongs_to :product
- belongs_to_active_hash :prefectures





