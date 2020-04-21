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
Item.create!(name:"Nice hiking carrier", description: "super nice", category:"hiking carrier", price_per_day: 28, location: "Zurich", user_id: 1)
Item.create!(name:"Really good stroller", description: "super duper nice", category:"jogging stroller", price_per_day: 35, location: "Baden", user_id: 2)

