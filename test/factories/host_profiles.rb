FactoryGirl.define do
  factory :host_profile do
    name { Faker::Name.name }
    country { Faker::Address.country_code }
    about { Faker::Lorem.paragraph }
    phone { Faker::PhoneNumber.phone_number }
    twitter 'kettuldev'
  end
end
