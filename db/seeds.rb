require 'open-uri'
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
user1 = User.create!(email: "lalala@gmail.com", password: "hellocucumber", first_name: "Jane", last_name: "Smith", username: "sweetpea121")
user2 = User.create!(email: "somebody@gmail.com", password: "password123", first_name: "John", last_name: "Doe", username: "luv2hike")
user3 = User.create!(email: "dallas@hotmail.com", password: "yeehaw2020",first_name: "Abby", last_name: "Hall", username: "Diamond Eye")

puts "Seeding items"
file = URI.open('https://images.pexels.com/photos/532803/pexels-photo-532803.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260')
hiking_carrier = Item.create!(name:"Nice hiking carrier", description: "super nice", category:"hiking carrier/backpack", price_per_day: 28, location: "Zurich", user: user1)
hiking_carrier.photos.attach(io: file, filename: 'hiking_carrier.jpeg', content_type: 'image/jpeg')

file = URI.open('https://images.pexels.com/photos/1007773/pexels-photo-1007773.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')
stroller = Item.create!(name:"Really good stroller", description: "super duper nice", category:"stroller/pram", price_per_day: 35, location: "Baden", user: user2)
stroller.photos.attach(io: file, filename: 'stroller.jpeg', content_type: 'image/jpeg')
stroller.save!

file = URI.open('https://images.unsplash.com/photo-1567408332664-24ed894cf462?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1534&q=80')
dwarf_adapter = Item.create!(name:"Dwarf adapter for behind your bike", description: "super safe", category:"bike trailer", price_per_day: 35, location: "Basel", user: user3)
dwarf_adapter.photos.attach(io: file, filename: 'dwarf_adapter.jpeg', content_type: 'image/jpeg')

puts "Seeding bookings"
Booking.create!(total_price: 35, start_day:Date.new(2020,3,2), end_day:Date.new(2020,3,3),user: user1, item: Item.last)
Booking.create!(total_price: 28, start_day:Date.new(2020,4,1), end_day:Date.new(2020,4,2),user: user3, item: Item.first)
