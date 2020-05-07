class ChangeTaxRateFromOrderItem < ActiveRecord::Migration[5.2]
  def change
    change_column :order_items, :tax_rate, :decimal, null: false
  end
end
