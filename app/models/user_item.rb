class UserItem
  include ActiveModel::Model
  attr_accessor :token, :name, :email, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_date, :image, :product_name, :description, :category_id, :condition_id, :shipping_fee_burden_id, :prefecture_id, :day_to_ship_id, :price, :postal_code, :prefecture_id, :city, :street, :building, :phone_number, :user_id, :product_id, :purchase_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
  end
    validate :custom_street_validation
    validates :phone_number, presence: true
    validates :phone_number, length: { minimum: 10, maximum: 11, message: "is too short" }
    validates :phone_number, format: { with: /\A\d+\z/, message: "Input only number" }

  def save
    ActiveRecord::Base.transaction do
      user =  User.create(name: name, email: email, first_name: first_name, last_name: last_name, first_name_kana: first_name_kana, last_name_kana: last_name_kana, birth_date: birth_date)
      product = Product.create(image: image, product_name: product_name, description: description, category_id: category_id, condition_id: condition_id, shipping_fee_burden_id: shipping_fee_burden_id, prefecture_id: prefecture_id, day_to_ship_id: day_to_ship_id, price: price, user_id: user_id)
      purchase = Purchase.create(user_id: user_id, product_id: product_id)
      shipping_address = Shipping_address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street: street, building: building, phone_number: phone_number, purchase_id: purchase_id)
    end
  end

  private

  def custom_street_validation
    if street.blank?
      errors.add(:street, "Addresses can't be blank")
    end
  end
end

