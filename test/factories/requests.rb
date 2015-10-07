FactoryGirl.define do
  factory :request do
    email
    message { Faker::Lorem.paragraphs(3).join }
  end
end
