class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum work_status: { not_available: 0, not_worked: 1, working: 2, worked: 3 }

  def price_with_tax
    (self.price * (1 + self.tax_rate)).to_i
  end

  def subtotal
    self.item.price_with_tax * self.amount
  end

end
