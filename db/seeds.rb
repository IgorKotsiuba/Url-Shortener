# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Plan.create!([
  { name: "Up To 10 Shorten URL Links For One Day", price: 0.10 },
  { name: "More Than 10 Shorten URL Links For One Day", price: 0.05 }
])

User.create!([
  { email: "user1@example.com", password: '00000000', password_confirmation: '00000000' },
  { email: "user2@example.com", password: '00000000', password_confirmation: '00000000' }
])
