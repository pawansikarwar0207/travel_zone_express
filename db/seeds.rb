# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

10.times do
  Hotel.create!(
    hotel_name: Faker::Company.name,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    address: Faker::Address.full_address,
    facilities: Faker::Lorem.words(number: 3).join(', '),
    hotel_services: Faker::Lorem.words(number: 3).join(', '),
    contact_number: Faker::PhoneNumber.phone_number,
    price_per_night: Faker::Commerce.price(range: 100..700, as_string: true)
  )
end