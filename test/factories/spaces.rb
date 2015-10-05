FactoryGirl.define do
  factory :space do
    user { create(:host) }
    name { Faker::Company.name }
    country { Faker::Address.country_code }
    description { Faker::Lorem.paragraphs }
  end
end
