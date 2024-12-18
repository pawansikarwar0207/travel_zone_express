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

# Seeding Tours
tour1 = Tour.create!(
  name: "Historical City Tour",
  description: "Explore the rich history of the city with guided tours to famous landmarks.",
  hours: "9 AM - 5 PM",
  image: "city_tour.jpg",
  average_rating: 4.7
)

tour2 = Tour.create!(
  name: "Nature Adventure",
  description: "A journey through the beautiful landscapes and nature reserves.",
  hours: "8 AM - 6 PM",
  image: "nature_tour.jpg",
  average_rating: 4.9
)

# Seeding Viewpoints for Tour 1
tour1.viewpoints.create!(name: "Old Castle", description: "A medieval castle overlooking the city.")
tour1.viewpoints.create!(name: "City Square", description: "A bustling square with shops and restaurants.")

# Seeding Viewpoints for Tour 2
tour2.viewpoints.create!(name: "Mountain Peak", description: "A breathtaking view from the highest mountain.")
tour2.viewpoints.create!(name: "River Walk", description: "A serene walk along the riverbanks.")

# Tour 3
tour3 = Tour.create!(
  name: "Beachside Getaway",
  description: "Relax and enjoy the serene beauty of pristine beaches.",
  hours: "10 AM - 6 PM",
  image: "beach_tour.jpg",
  average_rating: 4.8
)

# Seeding Viewpoints for Tour 3
tour3.viewpoints.create!(name: "Golden Sands Beach", description: "A beautiful sandy beach with crystal clear waters.")
tour3.viewpoints.create!(name: "Seaside Café", description: "Enjoy a meal with an ocean view.")

# Tour 4
tour4 = Tour.create!(
  name: "Mountain Hiking Expedition",
  description: "Conquer the mountains with a guided hike through challenging terrains.",
  hours: "6 AM - 7 PM",
  image: "mountain_tour.jpg",
  average_rating: 4.6
)

# Seeding Viewpoints for Tour 4
tour4.viewpoints.create!(name: "Eagle's Nest", description: "A high vantage point offering panoramic views of the mountains.")
tour4.viewpoints.create!(name: "Forest Trail", description: "A scenic hike through dense forests.")

# Tour 5
tour5 = Tour.create!(
  name: "Cultural Heritage Tour",
  description: "Discover the cultural and historical treasures of the region.",
  hours: "10 AM - 4 PM",
  image: "heritage_tour.jpg",
  average_rating: 4.5
)

# Seeding Viewpoints for Tour 5
tour5.viewpoints.create!(name: "Ancient Temple", description: "A centuries-old temple with intricate carvings.")
tour5.viewpoints.create!(name: "Cultural Museum", description: "A museum showcasing local artifacts and history.")

# Tour 6
tour6 = Tour.create!(
  name: "Desert Safari Adventure",
  description: "Experience the thrill of the desert with dune bashing, camel rides, and more.",
  hours: "3 PM - 9 PM",
  image: "desert_safari.jpg",
  average_rating: 4.9
)

# Seeding Viewpoints for Tour 6
tour6.viewpoints.create!(name: "Sand Dunes", description: "Massive sand dunes perfect for dune bashing and sandboarding.")
tour6.viewpoints.create!(name: "Bedouin Camp", description: "A traditional desert camp offering local cuisine and entertainment.")
tour6.viewpoints.create!(name: "Sunset Viewpoint", description: "Witness the stunning desert sunset over the horizon.")



# Similarly add logo and image for other flights...


5.times do |i|
  Event.create!(
    title: "Event ##{i + 1}",
    subtitle: "Subtitle for Event ##{i + 1}",
    location: "Washington, D.C.",
    venue: "Venue ##{i + 1}",
    map_link: "https://www.google.com/maps",
    reviews: rand(1..10),
    wishlists: rand(0..5),
    start_time: DateTime.now + i.days,
    duration: "#{rand(1..5)}H",
    city: ["San Francisco", "Los Angeles", "New York", "Chicago", "Miami"].sample,
    description: "Description for Event ##{i + 1}",
    highlights: "Highlight 1\nHighlight 2\nHighlight 3",
    image_url: ["https://placekitten.com/300/200", "https://placebear.com/300/200", "https://picsum.photos/300/200"].sample,
    event_type: ["Glastonbury", "Latitude", "Wilderness", "Exit Festival", "Primavera Sound"].sample
  )
end

# db/seeds.rb

# Ensure you have images in the following path: app/assets/images/boats/
boats_data = [
  {
    name: "My Way 100",
    rating: 4.7,
    reviews_count: 3,
    passengers: 15,
    crew: 3,
    price: 150,
    description: "Libero sem vitae sed donec conubia integer nisi integer rhoncus...",
    manufacturer: "Sunrise",
    model: "Summer Breeze",
    year: 2010,
    engines: "Diesel",
    fuel: "Composite",
    photo: 'my_way_100.jpg' # Ensure this image exists
  },
  {
    name: "Ocean Explorer",
    rating: 4.9,
    reviews_count: 5,
    passengers: 20,
    crew: 4,
    price: 250,
    description: "Vitae purus sit amet luctus venenatis lectus magna...",
    manufacturer: "Oceanic",
    model: "Wave Rider",
    year: 2015,
    engines: "Gas",
    fuel: "Petrol",
    photo: 'ocean_explorer.jpg' # Ensure this image exists
  },
  {
    name: "Sail Away",
    rating: 4.5,
    reviews_count: 8,
    passengers: 10,
    crew: 2,
    price: 180,
    description: "Sed nisi lacus sed viverra tellus in hac habitasse...",
    manufacturer: "WindSail",
    model: "Wind Glider",
    year: 2012,
    engines: "Electric",
    fuel: "Hybrid",
    photo: 'sail_away.jpg' # Ensure this image exists
  },
  {
    name: "Sea Breeze",
    rating: 4.6,
    reviews_count: 2,
    passengers: 12,
    crew: 3,
    price: 200,
    description: "Aliquam malesuada bibendum arcu vitae elementum curabitur...",
    manufacturer: "Breeze Inc.",
    model: "Seaside",
    year: 2018,
    engines: "Diesel",
    fuel: "Biofuel",
    photo: 'sea_breeze.jpg' # Ensure this image exists
  },
  {
    name: "Adventure Seeker",
    rating: 4.8,
    reviews_count: 4,
    passengers: 18,
    crew: 4,
    price: 300,
    description: "In ante metus dictum at tempor commodo ullamcorper a lacus...",
    manufacturer: "Adventure Co.",
    model: "Explorer",
    year: 2020,
    engines: "Gas",
    fuel: "Petrol",
    photo: 'adventure_seeker.jpg' # Ensure this image exists
  }
]

boats_data.each do |boat_data|
  Boat.create(
    name: boat_data[:name],
    rating: boat_data[:rating],
    reviews_count: boat_data[:reviews_count],
    passengers: boat_data[:passengers],
    crew: boat_data[:crew],
    price: boat_data[:price],
    description: boat_data[:description],
    manufacturer: boat_data[:manufacturer],
    model: boat_data[:model],
    year: boat_data[:year],
    engines: boat_data[:engines],
    fuel: boat_data[:fuel]
  ).tap do |boat|
    # Attach the photo
    boat.photo.attach(
      io: File.open(Rails.root.join('app/assets/images', boat_data[:photo])),
      filename: boat_data[:photo],
      content_type: 'image/jpeg'
    )
  end
end

FoodItem.create([
  {
    name: 'Cheeseburger',
    description: 'A juicy cheeseburger with fresh lettuce, tomato, and cheese.',
    price: 5.99,
    preparation_time: 15,
    photo_url: 'cheeseburger.jpg' # Image file stored in app/assets/images/
  },
  {
    name: 'Pepperoni Pizza',
    description: 'A classic pepperoni pizza with a crispy crust and gooey cheese.',
    price: 8.99,
    preparation_time: 20,
    photo_url: 'pepperoni_pizza.jpg' # Image file stored in app/assets/images/
  }
  # Add more items similarly
])

User.create(email: 'admin@example.com', password: 'password', admin: true) unless User.exists?(email: 'admin@example.com')
User.create(email: 'user@example.com', password: 'password')

User.all.each do |user|
  Reward.create(user: user, current_points: rand(100..1000))
end
