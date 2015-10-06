FactoryGirl.define do
  factory :space do
    user { create(:host) }
    name { Faker::Company.name }
    country { Faker::Address.country_code }
    description { Faker::Lorem.paragraphs.join("\n\n") }
    photos { build_list :space_photo, 1 }
  end
end
