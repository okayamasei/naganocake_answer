class CartItem < ApplicationRecord
  belongs_to :end_user
  belongs_to :item

  enum amounts: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
end
