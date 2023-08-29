# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


puts "Creating users..."

nii = User.create(first_name: "nii", last_name: "addo", email: "nii@gmail.com", password: "1234567")
david = User.create(first_name: "david", last_name: "lowe", email: "david@gmail.com", password: "1234567")

puts "Creating users..."

Property.create(name: "Sunny", property_type: "house", description: "3 bedroom house", address: "53 Old Bethnal Green Rd, Bethnal Green, London", user: nii)
Property.create(name: "Fly", property_type: "cottage", description: "2 bedroom cottage", address: "12 Old road, Bromyard", user: nii)
Property.create(name: "Pie", property_type: "house", description: "5 bedroom house", address: "66A Drayton Park, London", user: david)
Property.create(name: "Womble", property_type: "house", description: "7 bedroom house", address: "226 Blackstock Rd, London", user: david)
Property.create(name: "Friends", property_type: "house", description: "3 bedroom house", address: "52 St Thomas's Rd, Finsbury Park, London", user: nii)

puts "Finished!"

