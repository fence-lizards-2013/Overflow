# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

10.times do
  Question.create(title:Faker::Company.bs,content:Faker::Lorem.sentence(3),user_id: 1)
end

50.times do
  Answer.create(content:Faker::Lorem.sentence(4),answerable_id:rand(1..10), answerable_type: "Question", user_id: 1)  
end

User.create(email:Faker::Internet.email, password:'12345678')

