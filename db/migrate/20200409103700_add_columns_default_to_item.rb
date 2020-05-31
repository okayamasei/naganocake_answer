class AddColumnsDefaultToItem < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :genre_id,     :integer, null: false
    change_column :items, :name,         :string,  null: false
    change_column :items, :price,        :integer, null: false
    change_column :items, :sales_status, :integer, null: false, default: 1
  end
end
