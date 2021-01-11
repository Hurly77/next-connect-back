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
  education = Faker::Educator.degree
  work = Faker::Job.title
  relationship = Faker::Name.first_name + Faker::Name.last_name
  lives = Faker::Nation.capital_city
  from = Faker::Nation.capital_city
  photo_url = Faker::Avatar.image

  e = first + "_" + last + "@email.com"
  user = User.create(
    photo_url: photo_url,
    first_name: first,
    last_name: last,
    email: e,
    password: 'password',
    password_confirmation: 'password',
    work: work,
    education: education,
    relationship: relationship,
    from: from,
    lives: lives,
  )
  connect = first + last + user.id.to_s
    user.c_id = connect
    user.save
end

Post.destroy_all
i = User.first.id
10.times do 
  user = User.find_by(id: i)
  pix = Faker::LoremPixel.image(size: "550x600")
  3.times do
  Post.create(user_id: i, users_full_name: user.first_name + " " + user.last_name, users_avatar: user.photo_url, text: Faker::Lorem.sentence)
  PostPhoto.create(url: pix, post_id: i)
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
