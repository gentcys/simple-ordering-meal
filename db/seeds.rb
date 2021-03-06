# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100.times do |n|
  Meal.create(name: "Meal #{n}", price: rand(3.00..10.00), cut_off_at_day_of_week: rand(0..6), cut_off_at_time_of_day: Time.now.utc)
end
