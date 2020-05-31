class Genre < ApplicationRecord
  has_many :items
  enum is_valid: { valid_genre: true, invalid_genre: false }

  validates :name, presence: true

  def self.fetch_valid
    Genre.where(is_valid: "valid_genre")
  end
end
