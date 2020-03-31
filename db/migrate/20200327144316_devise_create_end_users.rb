# frozen_string_literal: true

class DeviseCreateEndUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :end_users do |t|

      t.string  :family_name       , null: false
      t.string  :first_name        , null: false
      t.string  :family_name_kana  , null: false
      t.string  :first_name_kana   , null: false
      t.string  :email             , null: false
      t.string  :zip_code          , null: false
      t.string  :address           , null: false
      t.string  :tel               , null: false
      t.string  :encrypted_password, null: false
      t.boolean :is_valid          , null: false, default: true

      t.timestamps null: false
    end

    add_index :end_users, :email,                unique: true
  end
end
