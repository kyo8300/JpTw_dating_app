# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@user1 = User.new(email: "test@example.com", password: "111111")
@user1.skip_confirmation!
@user1.save
@user2 = User.new(email: "testuser@example.com", password: "222222")
@user2.skip_confirmation!
@user2.save
@user3 = User.new(email: "testuser2@example.com", password: "2015love")
@user3.skip_confirmation!
@user3.save
@user4 = User.new(email: "testuser3@example.com", password: "333333")
@user4.skip_confirmation!
@user4.save
@user5 = User.new(email: "testuser4@example.com", password: "444444")
@user5.skip_confirmation!
@user5.save
@user6 = User.new(email: "testuser5@example.com", password: "555555")
@user6.skip_confirmation!
@user6.save


@user1.create_profile!(username: "Mike", sex: :male, birth: "1997-08-30", age: 21,nationality: :japan, height: 165, occupation: :student, singleword: "Hello", user_id: @user1.id, image: open("#{Rails.root}/public/img/s_male.jpg"))
@user2.create_profile!(username: "Bob", sex: :male, birth: "1998-06-30", age: 20,nationality: :taiwan, height: 179, occupation: :doctor, singleword: "Hello everyone", user_id: @user2.id, image: open("#{Rails.root}/public/img/noimage.jpg"))
@user3.create_profile!(username: "Hanako", sex: :female, birth: "1997-12-30", age: 20,nationality: :taiwan, height: 170, occupation: :doctor, singleword: "ifsaifi aifasifi faufiaafsai sif iasfi ifasifi aiasfj iajsaif ai", user_id: @user3.id, image: open("#{Rails.root}/public/img/noimage.jpg"))
@user4.create_profile!(username: "Green", sex: :female, birth: "1997-01-30", age: 21,nationality: :taiwan, height: 160, occupation: :student, singleword: "Good afternoon", user_id: @user4.id, image: open("#{Rails.root}/public/img/noimage.jpg"))
@user5.create_profile!(username: "Alice", sex: :female, birth: "1988-03-20", age: 30,nationality: :taiwan, height: 156, occupation: :estate, singleword: "How are you doing?", user_id: @user5.id, image: open("#{Rails.root}/public/img/noimage.jpg"))
@user6.create_profile!(username: "Karina", sex: :female, birth: "1968-11-01", age: 49,nationality: :japan, height: 153, occupation: :ca, singleword: "Like you ifsaifi aifasifi faufiaafsai sif iasfi ifasifi aiasfj iajsaif ai", user_id: @user6.id, image: open("#{Rails.root}/public/img/noimage.jpg"))

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = Faker::Internet.password(8)
  user = User.new(email: email, password: password)
  user.skip_confirmation!
  user.save
  user.create_profile!(
    username: name, 
    sex: :female, 
    birth: "1993-11-30", 
    age: 25,
    nationality: :taiwan, 
    height: 170, 
    occupation: :student, 
    singleword: "Hello world", 
    user_id: user.id,
    
  )
end


users = User.all
user  = users.first
following = users[4,5]
followers = users[2..6]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }