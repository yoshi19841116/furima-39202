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

## Users

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

- has_many :products_users
- has_many :purchases_users
- has_many :Shipping_addresses_users


## Products

|Column                  |Type   |Options                       |
|----------------------- | ----- | ---------------------------- |
|product_name            |string |null: false                   |
|description             |text   |null: false                   |
|category_id             |integer|null: false, foreign_key: true|
|condition_id            |integer|null: false, foreign_key: true|
|shipping_fee_burden_id  |integer|null: false, foreign_key: true|
|shipping_form_id        |integer|null: false, foreign_key: true|
|days_to_ship_id         |integer|null: false, foreign_key: true|
|price                   |integer|null: false                   |

## Categoriesテーブル (ActiveHash)

  id	name
  1	  Category A
  2	  Category B
  3	  Category C
  ...	 ...

## Conditionsテーブル (ActiveHash)

  id	name
  1	  New
  2	  Used
  3	  Refurbished
  ...	  ...

## ShippingFeeBurdenテーブル (ActiveHash)
  id	name
  1	  Buyer
  2	  Seller
  ...	  ...
## ShippingFormテーブル (ActiveHash)
  id	name
  1	  Mail
  2	  Courier
  ...	  ...

## DaysToShipテーブル (ActiveHash)
  id	name
  1	  1 day
  2	  2 days
  3	  3 days
  ...	  ...

### Association

- belongs_to :user
- belongs_to :product
- belongs_to_active_hash :Categories
- belongs_to_active_hash :Conditions
- belongs_to_active_hash :ShippingFeeBurden
- belongs_to_active_hash :ShippingForm
- belongs_to_active_hash :DaysToShip


## Purchases

|Column                    |Type    |Options                       |
|------------------------- | ------ | ---------------------------- |
|user_id                   |integer	|null: false, foreign_key: true|
|product_id	               |integer	|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :product

## Shipping_addresses

|Column               |Type     |Options                       |
|-------------------- | ------- | ------------------------ |
|user_id	            |integer	|null: false, foreign_key: true|
|product_id	          |integer	|null: false, foreign_key: true|
|postal_code          |string   |null: false                   |
|prefecture_id        |integer	|null: false, foreign_key: true|
|city                 |string   |null: false                   |
|street               |string   |null: false                   |
|building             |string   |                              |
|phone_number         |string   |null: false                   |

## Prefecturesテーブル (ActiveHash)

  id	name
  1	  北海道
  2	  青森県
  3	  岩手県
  ...	  ...

### Association

- belongs_to :user
- belongs_to :product
- belongs_to_active_hash :Prefectures





