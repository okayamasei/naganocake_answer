class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id  , null: false
      t.string :zip_code      , null: false
      t.string :address       , null: false
      t.string :destination   , null: false
      t.integer :pay_type     , null: false
      t.integer :order_status , null: false
      t.integer :postage      , null: false
      t.integer :amount       , null: false

      t.timestamps
    end
    add_index :orders, :end_user_id
  end
end
