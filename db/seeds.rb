# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning users, items, bookings"
User.destroy_all
Item.destroy_all
Booking.destroy_all

puts "Seeding users"
User.create!(email: "lalala@gmail.com", password: "hellocucumber")
User.create!(email: "somebody@gmail.com", password: "password123")
User.create!(email: "dallas@hotmail.com", password: "yeehaw2020")

puts "Seeding items"
Item.create!(name:"Nice hiking carrier", description: "super nice", category:"hiking carrier/backpack", price_per_day: 28, location: "Zurich", user_id: 1)
Item.create!(name:"Really good stroller", description: "super duper nice", category:"stroller/pram", price_per_day: 35, location: "Baden", user_id: 2)
Item.create!(name:"Dwarf adapter for behind your bike", description: "super safe", category:"bike trailer", price_per_day: 35, location: "Basel", user_id: 3)

puts "Seeding booking"
Booking.create!(total_price: 35, start_day:DateTime.new(2020,3,2), end_day:DateTime.new(2020,3,3),user_id: 1, item_id: 2)
Booking.create!(total_price: 28, start_day:DateTime.new(2020,4,1), end_day:DateTime.new(2020,4,2),user_id: 3, item_id: 1)
