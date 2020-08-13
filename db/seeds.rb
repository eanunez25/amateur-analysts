# create a main sample user
User.create!(username: "ExammpleUser",
              email: "example@railstutorial.org",
              password: "foobar",
              password_confirmation: "foobar")

# create a main sample user
User.create!(username: "ElvinAdminOverlord",
              email: "eanunez25@gmail.com",
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