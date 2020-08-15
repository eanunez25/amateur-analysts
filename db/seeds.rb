# create a main sample user
User.create!(username: "ElvinAdminOverlord",
              email: "eanunez25@gmail.com",
              password: "foobar",
              password_confirmation: "foobar",
              admin: true, 
              activated: true,
              activated_at: Time.zone.now) 

User.create!(username: "marissapotato",
              email: "marissa.jain@gmail.com",
              password: "foobar",
              password_confirmation: "foobar",
              admin: true, 
              activated: true,
              activated_at: Time.zone.now) 

# generate a bunch of additional users
99.times do |n|
  username = "Username#{n+1}"
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(username: username, email: email, password: password, password_confirmation: password, activated: true, activated_at: Time.zone.now)
end

# generate microposts for a subset of users
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content: content) }
end

# create following relationships
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }