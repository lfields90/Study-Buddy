Spot.create(
  state: "MA", city: 'Boston',
  zip_code: "12345", address: "33 Harrison Ave.",
  name: "Launch Academy",
  description: "It's a big room.",
  phone: "1434321434",
  website_url: "http://launchacademy.com",
  category: "room"
)
Review.create(rating: 3, body: 'The worst', spot_id: 1)
User.create(email: "test@test.com", encrypted_password: "testtest")

20.times do
  Spot.create(
    name: "#{ Faker::Company.name }",
    description: "#{ Faker::Company.bs }",
    category: "#{ Faker::Commerce.department }",
    address: "#{ Faker::Address.street_address }",
    city: "#{ Faker::Address.city }",
    state: "#{ Faker::Address.state }",
    zip_code: "02125",
    website_url: "#{ Faker::Internet.url }",
    phone: "#{ Faker::Number.number(10) }"
  )
end
