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
    phone: "#{ Faker::Number.number(10) }",
    user_id: rand(500)
  )
end
