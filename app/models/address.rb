class Address < ApplicationRecord
  belongs_to :end_user

  validates :zip_code, presence: true
  validates :address, presence: true
  validates :destination, presence: true

  def full_address
    "#{self.zip_code} #{self.address} #{self.destination}"
  end
end
