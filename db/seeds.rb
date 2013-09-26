# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def random_token
  foo = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a
  foo.sample(5).join
end

5.times do
  random = random_token
  u = User.create!(
    email: "mentor-#{random}@example.com",
    first_name: "Ima",
    last_name: "Mentor-#{random}",
    activated: true,
    twitter_handle: "mentor_#{random}")

  u.availabilities.create!(
    start_time: 1.week.from_now,
    duration: 30,
    location: "Dev Bootcamp",
    timezone: "Central Time (US & Canada)")
end

mentee = User.create!(
  email: "mentee@example.com",
  first_name: "Ima",
  last_name: "Mentee",
  activated: true,
  twitter_handle: "mentee"
)

a = Availability.order("random()").first
Appointment.create!(mentee: mentee, mentor: a.mentor, availability: a)