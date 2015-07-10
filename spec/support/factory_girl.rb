require 'factory_girl'

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(10, 20) }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    username { Faker::Internet.user_name }

    factory :admin do
      admin true
    end
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

    user
  end

  factory :review do
    body { Faker::Lorem.sentence(3) }
    rating { rand(1..5) }
    spot
    user
  end
end
