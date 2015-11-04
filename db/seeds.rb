# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create(
  email: 'admin@test.com', password: 'testing12345', role: 'admin'
)

host = User.create(
  email: 'host@test.com', password: 'testing12345', role: 'host'
)

Page.create(title: 'Sample Page', body: 'Content goes here!', published: true)

Page.create(
  title: 'Draft Page',
  body: 'Content goes here!',
  published: false,
  layout: 'page_with_right_sidebar'
)

@menu = Menu.create(name: 'Main Menu', key: 'main')
@menu.items << MenuItem.new(link_label: 'About', link_url: '/about')
@menu.items << MenuItem.new(link_label: 'Support', link_url: 'http://gofundme.com')

host.profile.update_attributes(
  name: 'Bobby',
  country: 'US'
)

10.times do
  host.spaces << Space.new(
    name: Faker::Company.name,
    locality:  Faker::Address.city,
    administrative_area: Faker::Address.state,
    country: Faker::Address.country_code,
    postal_code: Faker::Address.postcode,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    description: Faker::Lorem.paragraphs.join("\n\n"),
    number_of_rooms: 1,
    number_of_people_allowed: 2
  )
end

10.times do
  Feature.create name: Faker::Company.buzzword
end
