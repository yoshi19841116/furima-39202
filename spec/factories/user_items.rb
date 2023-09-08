FactoryBot.define do
  factory :user_item do
    product_id { 1 }
    user_id { 1 }
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { "#{Faker::Number.between(from: 100, to: 999)}-#{Faker::Number.between(from: 1000, to: 9999)}" }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city { Faker::Address.city }
    street { Faker::Address.street_address }
    building { Faker::Address.building_number }
    phone_number { '0' + Faker::Number.between(from: 100_000_000, to: 9_999_999_999).to_s }
  end
end
