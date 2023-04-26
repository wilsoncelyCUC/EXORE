# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database ..."
Account.destroy_all
Social.destroy_all
Criterium.destroy_all
Position.destroy_all
User.destroy_all


#Creation test user
usertest = User.create!(
  email: 'home@test.com',
  password: 'password'
)
puts "TEST USER #{usertest.email} created (LOGIN with this one)"
#===================


#Create Positions
position1 = Position.create!(
  position_name: "Back Developer",
  mk_salary: "50.000 Eur/year"
)
puts "#{position1.position_name} was created"

position2 = Position.create!(
  position_name: "Front Developer",
  mk_salary: "45.000 Eur/year"
)
puts "#{position2.position_name} was created"

position3 = Position.create!(
  position_name: "Full Stack Developer",
  mk_salary: "60.000 Eur/year"
)
puts "#{position3.position_name} was created"


#===================
