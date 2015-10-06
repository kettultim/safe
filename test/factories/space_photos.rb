FactoryGirl.define do
  factory :space_photo do
    image File.open("#{Rails.root}/test/resources/test.jpg")
  end
end
