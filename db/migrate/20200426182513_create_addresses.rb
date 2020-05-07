class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :end_user_id  , null: false
      t.string :zip_code      , null: false
      t.string :address       , null: false
      t.string :destination   , null: false

      t.timestamps
    end
    add_index :addresses, :end_user_id
  end
end
