# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(username: "Kyo", sex: :male, birth: "1997-08-30",nationality: :japan, height: 179, occupation: :doctor, singleword: "Like you",
            email: "kametyou@gmail.com", password: "s0ccerlove")
User.create(email: "malaysia@example.com", password: "liuliwei")
User.create(email: "foobar@example.com", password: "2015love")
User.create(email: "inmyheart@example.com", password: "ellegarden")