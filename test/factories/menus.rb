FactoryGirl.define do
  factory :menu do
    key { Faker::Internet.slug }
    name { Faker::Name.title }
  end

  factory :menu_with_items, parent: :menu do
    items { build_list :menu_item, 3 }
  end

  factory :three_level_menu, parent: :menu do
    items { build_list :menu_item_with_two_sub_levels, 3 }
  end
end
