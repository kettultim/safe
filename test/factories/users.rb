FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :user do
    email
    password 'testing12345'

    factory :admin do
      role 'admin'
    end
  end
end
