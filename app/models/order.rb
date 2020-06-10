class Order < ApplicationRecord
  belongs_to :end_user
  has_many :order_items
  attr_accessor :address_status, :address_id
  after_update_commit :to_not_worked, if: :deposited?

  ADDRESS_STATUS_DEFAULT = "self"
  POSTAGE_DEFAULT = 800
  after_initialize do |obj|
    obj.address_status ||= ADDRESS_STATUS_DEFAULT
    obj.postage ||= POSTAGE_DEFAULT
  end

  enum pay_type: { credit_cart: 1, bank_transfer: 2 }
  enum order_status: { before_deposite: 0, deposited: 1, in_production: 2, shipping: 3, shipped: 4 }
  enum address_status: { self: 1, registered: 2, registration: 3 }

  validates :zip_code, presence: true
  validates :address, presence: true
  validates :destination, presence: true

  def sum_order_items
    self.order_items.inject(0) {|sum, object| sum + object.amount}
  end

  def sum_order_item_prices
    self.order_items.inject(0) {|sum, object| sum + object.subtotal}
  end

  def amount_excluded_postage
    self.amount - self.postage
  end

  def deposited?
    self.order_status == 'deposited'
  end

  def to_not_worked
    self.order_items.update_all(work_status: 'not_worked')
  end

end
