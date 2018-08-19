# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(username: "Kyo", sex: :male, birth: "1997-08-30",age: 20,nationality: :japan, height: 179, occupation: :doctor, singleword: "Like you",
            email: "kametyou@gmail.com", password: "s0ccerlove")
User.create(username: "Liu mike", sex: :male, birth: "1996-02-20",age: 22,nationality: :taiwan, height: 174, occupation: :student, singleword: "Like you",
            email: "malaysia@example.com", password: "liuliwei")
User.create(username: "Yoshiko", sex: :female, birth: "1978-11-11",age: 39,nationality: :japan, height: 154, occupation: :education, singleword: "Like you",
            email: "foobar@example.com", password: "2015love")
User.create(username: "Chen jessie", sex: :female, birth: "1967-08-20",age: 50,nationality: :taiwan, height: 170, occupation: :student, singleword: "Like you",
            email: "inmyheart@example.com", password: "ellegarden")