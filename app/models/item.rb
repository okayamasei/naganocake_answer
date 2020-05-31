class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  attachment :image

  enum sales_status: { sale: 1, sold_out: 2 }
  validates :genre_id, presence: true

  def price_with_tax
    (self.price * 1.10).to_i
  end

end
