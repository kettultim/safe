FactoryGirl.define do
  factory :space do
    user { create(:host) }
    name { Faker::Company.name }
    locality { Faker::Address.city }
    administrative_area { Faker::Address.state }
    country { Faker::Address.country_code }
    postal_code { Faker::Address.postcode }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    description { Faker::Lorem.paragraphs.join("\n\n") }
    photos { build_list :space_photo, 1 }
    availabilities { build_list :availability, 3 }
  end
end
