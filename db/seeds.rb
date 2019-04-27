# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@user1 = User.new(email: "kametyou777@gmail.com", password: "s0ccerlove")
@user1.skip_confirmation!
@user1.save
@user2 = User.new(email: "malaysia@example.com", password: "liuliwei")
@user2.skip_confirmation!
@user2.save
@user3 = User.new(email: "foobar@example.com", password: "2015love")
@user3.skip_confirmation!
@user3.save
@user4 = User.new(email: "weny@example.com", password: "wenydao")
@user4.skip_confirmation!
@user4.save
@user5 = User.new(email: "inmyheart@example.com", password: "ellegarden")
@user5.skip_confirmation!
@user5.save
@user6 = User.new(email: "aklojp@example.com", password: "redpill")
@user6.skip_confirmation!
@user6.save


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
  user = User.new(email: email, password: password)
  user.skip_confirmation!
  user.save
  user.create_profile!(username: name, sex: :female, birth: "1993-11-30", age: 25,nationality: :taiwan, height: 170, occupation: :student, singleword: "Like you")
end


users = User.all
user  = users.first
following = users[4,5]
followers = users[2..6]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }