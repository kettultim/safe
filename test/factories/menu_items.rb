FactoryGirl.define do
  factory :menu_item do
    menu
    link_url { Faker::Internet.url }
    link_label { Faker::Name.title }
  end

  factory :menu_item_with_one_sub_level, parent: :menu_item do
    items { build_list :menu_item, 3 }
  end

  factory :menu_item_with_two_sub_levels, parent: :menu_item do
    items { build_list :menu_item_with_one_sub_level, 3 }
  end
end
