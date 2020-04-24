class AddDefaultIsValidToGenre < ActiveRecord::Migration[5.2]
  def change
    change_column :genres, :is_valid, :boolean, null: false, default: true
  end
end
