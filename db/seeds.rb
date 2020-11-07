# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
i = 0
first = Faker::Name.first_name
last = Faker::Name.last_name
e = Faker::Name.last_name + "_" +  Faker::Name.first_name + "@email.com"
while i < 10 do
  User.create(first_name: first, last_name: last, email: e)
  i = i + 1
end