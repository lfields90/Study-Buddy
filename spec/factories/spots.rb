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
