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

|Column        |Type  |Options    |
|name          |string|null: false|
|email         |string|null: false|
|password      |string|null: false|
|full_name     |string|null: false|
|full_name_kana|string|null: false|
|birth_date    |string|null: false|

## Products

|Column             |Type   |Options    |
|image              |binary |null: false|
|image_url          |string |null: false|
|product_name       |string |null: false|
|description        |text   |null: false|
|category           |string |null: false|
|condition          |string |null: false|
|shipping_fee_burden|string |null: false|
|shipping_form      |string |null: false|
|days_to_ship       |integer|null: false|
|price              |decimal|null: false|

## Items

|Column             |Type    |Options    |
|listing            |boolean |null: false|
|derail             |string  |null: false|
|edit               |string  |null: false|
|delete             |boolean |null: false|


## Purchases

|Column                    |Type    |Options    |
|id                        |integer |null: false|
|card_number               |string  |null: false|
|credit_card_expirations   |string  |null: false|
|credit_card_security_codes|string  |null: false|

## Shipping_addresses

|Column        |Type  |Options    |
|postal_code   |string|null: false|
|prefecture    |string|null: false|
|city          |string|null: false|
|street        |string|null: false|
|building      |string|           |
|phone_number  |string|null: false|

### Association

* Users Table and ShippingAddresses Table: One-to-Many

* Users Table and Products Table: One-to-Many

* Users Table and Purchases Table: One-to-Many

* Users Table and Items Table: One-to-Many

* Items Table and Products Table: One-to-Many

* Purchases Table and Items Table: has-one