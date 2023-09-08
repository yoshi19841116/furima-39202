class UserItem
  include ActiveModel::Model
  attr_accessor :product_id, :user_id, :postal_code, :prefecture_id, :city, :street, :building, :phone_number, :token
 
  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
  end
  validate :custom_street_validation
  validates :phone_number, presence: true
  validates :phone_number, length: { minimum: 10, maximum: 11, message: "is too short" }
  validates :phone_number, format: { with: /\A\d+\z/, message: "Input only number" }
  

  def save_with_purchase(user_id, item_id)
    purchase = Purchase.create(product_id: item_id.to_i, user_id: user_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street: street, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end

  private

  def custom_street_validation
    if street.blank?
      errors.add(:street, "Addresses can't be blank")
    end
  end


