class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders
  enum is_valid: { valid_user: true, invalid_user: false }

  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :email, presence: true
  validates :zip_code, presence: true
  validates :address, presence: true
  validates :tel, presence: true

  def active_for_authentication?
    super && self.is_valid == "valid_user"
  end

  def full_name
    @full_name = "#{self.family_name} #{self.first_name}"
  end

  def full_name_kana
    @full_name_kana = "#{self.family_name_kana} #{self.first_name_kana}"
  end

  # def member_status
  #   @member_status = self.is_valid ? "有効" : "無効"
  # end
end
