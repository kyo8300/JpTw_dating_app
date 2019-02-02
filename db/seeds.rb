# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "kametyou777@gmail.com", password: "s0ccerlove")
User.create(email: "malaysia@example.com", password: "liuliwei")
User.create(email: "foobar@example.com", password: "2015love")
User.create(email: "weny@example.com", password: "wenydao")
User.create(email: "inmyheart@example.com", password: "ellegarden")
User.create(email: "aklojp@example.com", password: "redpill")


@user1 = User.find(1)
@user2 = User.find(2)
@user3 = User.find(3)
@user4 = User.find(4)
@user5 = User.find(5)
@user6 = User.find(6)

@user1.create_profile!(username: "Kyo", sex: :male, birth: "1997-08-30", age: 21,nationality: :japan, height: 165, occupation: :student, singleword: "Like you")
@user2.create_profile!(username: "Riu", sex: :male, birth: "1998-06-30", age: 20,nationality: :taiwan, height: 179, occupation: :doctor, singleword: "Like you")
@user3.create_profile!(username: "Keji", sex: :female, birth: "1997-12-30", age: 20,nationality: :taiwan, height: 170, occupation: :doctor, singleword: "Like you ifsaifi aifasifi faufiaafsai sif iasfi ifasifi aiasfj iajsaif ai")
@user4.create_profile!(username: "Yang ju", sex: :female, birth: "1997-01-30", age: 21,nationality: :taiwan, height: 160, occupation: :student, singleword: "Like you")
@user5.create_profile!(username: "PEPE", sex: :female, birth: "1988-03-20", age: 30,nationality: :taiwan, height: 156, occupation: :estate, singleword: "Like you")
@user6.create_profile!(username: "Karina", sex: :female, birth: "1968-11-01", age: 49,nationality: :japan, height: 153, occupation: :ca, singleword: "Like you ifsaifi aifasifi faufiaafsai sif iasfi ifasifi aiasfj iajsaif ai")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = Faker::Internet.password(8)
  user = User.create!(email: email, password: password)
  user.create_profile!(username: name, sex: :female, birth: "1993-11-30", age: 25,nationality: :taiwan, height: 170, occupation: :student, singleword: "Like you")
end


users = User.all
user  = users.first
following = users[4,5]
followers = users[2..6]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }