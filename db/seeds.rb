# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Spot.create(
  state: "MA", city: 'Boston', zip_code: "12345",address: "33 Harrison Ave.",
  name: "Launch Academy", description: "It's a big room.", phone: "1434321434",
  website_url: "http://launchacademy.com", category: "room"
  )
