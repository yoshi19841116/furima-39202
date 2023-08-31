class Purchase < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :product, optional: true
  has_one :shipping_address

end
