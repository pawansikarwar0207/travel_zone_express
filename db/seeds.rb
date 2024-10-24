# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

10.times do
  hotel = Hotel.create!(
    hotel_name: Faker::Company.name,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    address: Faker::Address.full_address,
    contact_number: Faker::PhoneNumber.phone_number,
    price_per_night: Faker::Commerce.price(range: 100..700, as_string: true),
    property_type: Faker::Company.industry,
    highlights: Faker::Lorem.sentence
  )

  # Add facilities associated with the hotel
  3.times do
    hotel.facilities.create!(
      name: Faker::Lorem.word
    )
  end

  # Add services associated with the hotel
  3.times do
    hotel.hotel_services.create!(
      name: Faker::Lorem.word
    )
  end
end

# db/seeds.rb

10.times do |index|
  car = Car.create(
    name: Faker::Vehicle.make_and_model,
    brand: Faker::Vehicle.manufacturer,
    model: Faker::Vehicle.model,
    price_per_day: Faker::Commerce.price(range: 50..300),
    available: [true, false].sample
  )

  file_path = Rails.root.join('app', 'assets', 'images', "car#{index + 1}.jpg") # Ensure the extension is correct

  if File.exist?(file_path)
    car.photo.attach(io: File.open(file_path), filename: "car#{index + 1}.jpg")
    puts "Attached photo to Car #{car.id}" # Optional: Print a confirmation
  else
    puts "File not found: #{file_path}" # Log if the file does not exist
  end
end
