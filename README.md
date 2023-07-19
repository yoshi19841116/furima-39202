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
|email         |string|unique: true|
|encrypted_password      |string|null: false|
|first_name     |string|null: false|
|last_name      |string|null: false|
|first_name_kana|string|null: false|
|last_name_kana |string|null: false|
|birth_date     |date  |null: false|

## Products

|Column             |Type   |Options    |
|product_name       |string |null: false|
|description        |text   |null: false|
|price              |decimal|null: false|

* Users Table and Products Table: One-to-Many

## Purchases

|Column                    |Type    |Options    |
|id                        |integer |null: false|

* Users Table and Purchases Table: One-to-Many

## Shipping_addresses

|Column        |Type  |Options    |
|postal_code   |string|null: false|
|city          |string|null: false|
|street        |string|null: false|
|building      |string|           |
|phone_number  |string|null: false|

* Users Table and ShippingAddresses Table: One-to-Many






