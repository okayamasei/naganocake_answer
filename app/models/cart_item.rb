class CartItem < ApplicationRecord
  belongs_to :end_user
  belongs_to :item

  enum is_valid: { valid_user: true, invalid_user: false }
  enum amounts: {
    "1": 1,
    "2": 2,
    "3": 3,
    "4": 4,
    "5": 5,
    "6": 6,
    "7": 7,
    "8": 8,
    "9": 9,
    "10": 10,
  }

  def subtotal
    self.item.price_with_tax * self.amount
  end
end
