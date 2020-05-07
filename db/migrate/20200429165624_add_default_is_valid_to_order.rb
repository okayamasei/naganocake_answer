class AddDefaultIsValidToOrder < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :pay_type, :integer, null: false, default: 1
    change_column :orders, :order_status, :integer, null: false, default: 0
  end
end
