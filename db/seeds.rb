# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Page.destroy_all

User.create(email: 'admin@test.com', password: 'testing12345', role: 'admin')

Page.create(title: 'Sample Page', body: 'Content goes here!', published: true)
Page.create(title: 'Draft Page', body: 'Content goes here!', published: false)
