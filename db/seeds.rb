# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Event.destroy_all
Attendance.destroy_all

# 30.times do
#   user_name = Faker::Name.first_name
#   user_name_low = user_name.downcase
#   user_lastname = Faker::Name.last_name
#   User.create(email: "#{user_name_low}@yopmail.com", first_name: user_name, last_name: user_lastname)
# end

# 7.times do |index|
#   Event.create(title: "event#{index}", admin: User.all.sample)
# end