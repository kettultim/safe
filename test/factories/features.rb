FactoryGirl.define do
  factory :feature do
    name { Faker::Company.buzzword }
  end
end
