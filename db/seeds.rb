# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Reservation.destroy_all
Performance.destroy_all
User.destroy_all

20.times do |i|
  user = User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, address: Faker::Address.city, email: Faker::Internet.free_email, password: "password")
  performance = Performance.create!(
    user: user,
    title: Faker::Ancient.primordial,
    description: Faker::Lorem.paragraph(2),
    price: rand(150...450),
    is_visible: true,
    category: ["Concert", "Danse", "Stand-up", "Painter", "DJ"].sample
  )
end
