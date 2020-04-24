class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.text :description
      t.string :image_id
      t.integer :price
      t.integer :sales_status

      t.timestamps
    end
  end
end
