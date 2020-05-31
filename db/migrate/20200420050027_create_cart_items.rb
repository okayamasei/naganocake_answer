class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :end_user_id, null: false
      t.integer :item_id    , null: false
      t.integer :amount     , null: false

      t.timestamps
    end
    add_index :cart_items, :end_user_id
  end
end
