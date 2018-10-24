# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#EVENTS
a = Event.create!(title: "Work", description: "opener", date: "2018-10-16", date_object: "2018-10-16", start_time: "4pm", end_time: "5pm", user_id: 1 )
b = Event.create!(title: "workout", description: "legs", date: "2018-10-21", date_object: "2018-10-21", start_time: "9pm", end_time: "10pm", user_id: 1 )
c = Event.create(title: "HALLOWEEN", description: "neighborhood trick or treat begins at 6 pm", date: "2018-10-31", date_object: "2018-10-31", start_time: "6pm", end_time: "8pm", user_id: 1 )
d = Event.create!(title: "Meet with Advisor", description: "opener", date: "2018-10-25", date_object: "2018-10-25", start_time: "4pm", end_time: "5pm", user_id: 1 )
a = Event.create!(title: "Doctors Appt", description: "opener", date: "2018-10-26", date_object: "2018-10-26", start_time: "4pm", end_time: "5pm", user_id: 1 )

puts "seeded dbase"