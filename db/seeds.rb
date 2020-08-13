# create a main sample user
User.create!(username: "ExammpleUser",
              email: "example@railstutorial.org",
              password: "foobar",
              password_confirmation: "foobar")
            
# generate a bunch of additional users
99.times do |n|
  username = "Username#{n+1}"
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(username: username, email: email, password: password, password_confirmation: password)
end