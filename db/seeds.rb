# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

tags = []
3.times do
  tags << Tag.create(tag_name: Faker::Lorem.words(1))
end

10.times do
  Question.create(title:Faker::Company.bs,content:Faker::Lorem.sentence(10),user_id: 1).tags << tags.sample
end

50.times do
  Answer.create(content:Faker::Lorem.sentence(11),answerable_id:rand(1..10), answerable_type: "Question", user_id: 1)  
end

User.create(name:'ADMIN', email:'fabulous@faballthetime.com', password:'12345678', admin:true)
User.create(name:'ADAM', email:'test@gmail.com', password: '12345678')


Tag.create(tag_name:"shoes")
Tag.create(tag_name:"hat")
Tag.create(tag_name:"iceburg")

