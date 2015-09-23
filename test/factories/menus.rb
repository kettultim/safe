FactoryGirl.define do
  factory :menu do
    key Faker::Internet.slug
    name Faker::Name.title

    factory :menu_with_items do
      items { build_list :menu_item, 3 }
    end
  end
end
