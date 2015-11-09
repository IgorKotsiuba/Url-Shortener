# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Plan.create!([
  { name: "Up To 10 Shorten URL Links Per Day", price: 0.10, min_numb_links: 1, max_numb_links: 9 },
  { name: "More Than 10 Shorten URL Links Per Day", price: 0.05, min_numb_links: 11, max_numb_links: 100 }
])

User.create!([
  { email: "user1@example.com", password: '00000000', password_confirmation: '00000000' },
  { email: "user2@example.com", password: '00000000', password_confirmation: '00000000' }
])

Link.create!([
  {original:"https://github.com/" , short: "1", clicks: 0, user_id: 1},
  {original:"http://guides.rubyonrails.org/", short: "2", clicks: 0, user_id: 1},
  {original:"http://n-ix.com/", short: "3", clicks: 0, user_id: 1},
  {original:"https://www.google.com.ua/", short: "4", clicks: 1, user_id: 1},
  {original:"https://www.ukr.net/", short: "5", clicks: 0, user_id: 1}
])
