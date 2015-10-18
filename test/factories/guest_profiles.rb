FactoryGirl.define do
  factory :guest_profile do
    name { Faker::Name.name }
    country { Faker::Address.country_code }
    about { Faker::Lorem.paragraph }
    phone { Faker::PhoneNumber.phone_number }
    twitter 'kettuldev'
    number_living_with { Random.new.rand(1...10) }
  end
end
