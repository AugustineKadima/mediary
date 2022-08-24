# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user1 = User.create(name:"John Doe", email:"jd@gmail.com", password:"password", username:"@jd", age:20)
user2 = User.create(name:"Jane Doe", email:"janed@gmail.com", password:"password", username:"@janed", age:70)


user1.notes.create(title:"The walk", description:"Today I walked for 10 km")
user1.notes.create(title:"The Swim", description:"Today I swam for 10 km")
user2.notes.create(title:"The Jump", description:"Today I jumped for 10 km")
user2.notes.create(title:"The Sleep", description:"Today I slept for 10 hrs")