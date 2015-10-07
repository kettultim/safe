FactoryGirl.define do
  factory :availability do
    start_date { Faker::Date.backward(365) }
    end_date { Faker::Date.forward(365) }
  end
end
