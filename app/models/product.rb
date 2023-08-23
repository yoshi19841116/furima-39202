class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_burden
  belongs_to :prefecture
  belongs_to :day_to_ship
  belongs_to :user
  has_one_attached :image

  validates :product_name, :string, presence: true
  validates :description, :text, presence: true
  validates :price, :integer, presence: true

  validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :shipping_fee_burden_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :day_to_ship_id, numericality: { other_than: 1, message: "can't be blank"} 
end
