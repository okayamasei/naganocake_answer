class Genre < ApplicationRecord
  has_many :items
  enum is_valid: { valid_genre: true, invalid_genre: false }

  validates :name, presence: true
end
