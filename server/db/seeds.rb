# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
$i = 0

until $i > 100 do
  Post.create(
    title: Faker::Company.bs,
    author: Faker::Name.name,
    content: Faker::Lorem.paragraph
  )
  $i +=1;
end