class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  after_update_commit :to_in_production, if: :working?
  after_update_commit :to_shipping, if: :all_worked?

  enum work_status: { not_available: 0, not_worked: 1, working: 2, worked: 3 }

  def price_with_tax
    (self.price * (1 + self.tax_rate)).to_i
  end

  def subtotal
    self.item.price_with_tax * self.amount
  end

  def working?
    self.work_status == 'working'
  end

  def all_worked?
    self.order.order_items.select { |r| r.work_status == 'worked' }.length == self.order.order_items.length
  end

  def to_in_production
    self.order.update(order_status: 'in_production')
  end

  def to_shipping
    self.order.update(order_status: 'shipping')
  end

end
