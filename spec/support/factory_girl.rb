require 'factory_girl'

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(10, 20) }
  end

  factory :spot do
    name { Faker::Company.name }
    description { Faker::Company.bs }
    category { Faker::Commerce.department }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip_code "02125"
    website_url { Faker::Internet.url }
    phone { Faker::Number.number(10) }
  end

  factory :review do
    body { Faker::Lorem.sentence(3) }
    rating { rand(1..5) }
    spot_id { 1 }
    user_id { 1 }
  end
end
