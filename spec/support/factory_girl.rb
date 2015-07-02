require 'factory_girl'

FactoryGirl.define do
  factory :user do |f|
    f.email { Faker::Internet.email }
    f.password { Faker::Internet.password(10, 20) }
  end
end

FactoryGirl.define do
  factory :spot do |f|
    f.name { Faker::Company.name }
    f.description { Faker::Company.bs }
    f.category { Faker::Commerce.department }
    f.address { Faker::Address.street_address }
    f.city { Faker::Address.city }
    f.state { Faker::Address.state }
    f.zip_code "02125"
    f.website_url { Faker::Internet.url }
    f.phone { Faker::Number.number(10) }
  end
end

  FactoryGirl.define do
    factory :review do |f|
      f.body { Faker::Lorem.name }
      f.rating { rand(1..5) }
      f.spot_id { 1 }
      f.user_id { 1 }
    end
end
