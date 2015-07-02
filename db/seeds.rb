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
