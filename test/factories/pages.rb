FactoryGirl.define do
  factory :page do
    title Faker::Lorem.words(3).join(' ')
    body Faker::Lorem.paragraphs(3).map {|p| "<p>#{p}</p>" }.join
    published true

    factory :unpublished_page do
      published false
    end
  end
end
