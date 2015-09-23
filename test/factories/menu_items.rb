FactoryGirl.define do
  factory :menu_item do
    menu_id 1
    link_url Faker::Internet.url
    link_label Faker::Name.title
  end
end
