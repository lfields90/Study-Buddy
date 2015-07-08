require 'factory_girl'

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(10, 20) }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    username { Faker::Internet.user_name }

    factory :admin_user do
      admin true
    end

    factory :signed_in_user do
      current_sign_in_at {
        DateTime.now.in_time_zone("Pacific Time (US & Canada)")
      }
    end
  end

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
    f.user_id "1"
  end

  factory :review do |f|
    f.body { Faker::Lorem.sentence(3) }
    f.rating { rand(1..5) }
    f.spot_id { 1 }
    f.user_id { 1 }
  end
end
