# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
10.times do 
  first = Faker::Name.first_name
  last = Faker::Name.last_name
  e = first + "_" + last + "@email.com"
  User.create(first_name: first, last_name: last, email: e, password: '123', password_confirmation: '123')
end

Post.destroy_all
i = User.first.id
10.times do 
  3.times do
  Post.create(user_id: i, img: '', text: Faker::Lorem.sentence)
  end
  i +=1
end

Comment.destroy_all
j = Post.first.id
id = User.first.id
10.times do
  2.times do 
    Comment.create(user_id: id, post_id: j, text: Faker::Lorem.sentence)
    j += 1
  end
  id += 1
end
