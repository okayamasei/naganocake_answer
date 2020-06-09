# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(email: 'admin@admin', password: '12345678').save if Admin.find_by(email: 'admin@admin').nil?

Genre.create(name: 'ケーキ') if Genre.find_by(name: 'ケーキ').nil?
Genre.create(name: 'その他') if Genre.find_by(name: 'その他').nil?

Item.create(name: 'ケーキ', genre_id: 1, price: 2500, sales_status: 'sale') if Item.find_by(name: 'ケーキ').nil?
