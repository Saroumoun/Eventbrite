30.times do
 user = User.create(
 	first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  description: Faker::Lorem.sentence,
  encrypted_password: SecureRandom.urlsafe_base64,
  email: Faker::Internet.email
 	)
end

10.times do
 event = Event.create(
  title: Faker::Beer.name,
  description: Faker::Lorem.paragraph,
  start_date: Faker::Date.forward(30), 
  duration: 5 * rand(1..10),
  price: rand(1..1000),
  location: Faker::Address.city,
  admin: User.all.sample
 	)
end

10.times do
 attendance = Attendance.create(
  stripe_customer_id: SecureRandom.urlsafe_base64,
  attendee: User.all.sample,
  event: Event.all.sample,
 	)
end
