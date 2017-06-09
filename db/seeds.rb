5.times do
  registered_applications = RegisteredApplication.create!(
    name: Faker::Company.name,
    url: Faker::Company.logo
    )
end
   
5.times do
  events = Event.create!(
    registered_application_id: 5,
    name: "event 1"
    )
end

puts "Seeded"