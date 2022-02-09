# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.new(name: "toto", email:"tt@test.com", password:"test11")
user1.save!
group1 = Group.new(name: "Food", icon: "this is an icon", user_id: user1.id)
