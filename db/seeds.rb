User.create!(
  name: "Admin",
  email: "admin@railstutorial.org",
  password: "12345678",
  password_confirmation: "12345678",
  role: 1)

20.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "12345678"
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    role: 0)
end
