class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def active_for_authentication?
    super && self.is_valid == true
  end
  def full_name
    @full_name = "#{self.family_name} #{self.first_name}"
  end

  def full_name_kana
    @full_name_kana = "#{self.family_name_kana} #{self.first_name_kana}"
  end

  def member_status
    @member_status = self.is_valid ? "有効" : "無効"
  end
end
