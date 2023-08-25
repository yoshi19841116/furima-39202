FactoryBot.define do
  factory :product do
    product_name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph }
    price { rand(300..9_999_999) }
    category { Category.all.sample }
    condition { Condition.all.sample }
    shipping_fee_burden { ShippingFeeBurden.all.sample }
    prefecture { Prefecture.all.sample }
    day_to_ship { DayToShip.all.sample }
    association :user
  end
end
