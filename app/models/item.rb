class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_items
  attachment :image

  enum sales_status: { sale: 1, sold_out: 2 }
  validates :name , presence: true
  validates :genre, presence: true
  validates :price, presence: true
  validates :sales_status, presence: true
  attr_accessor :tax_rate

  after_initialize do |obj|
    obj.tax_rate = 0.10
  end

  def price_with_tax
    (self.price * (1 + self.tax_rate)).to_i
  end

end
