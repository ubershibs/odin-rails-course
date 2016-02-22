# Airprorts

Airport.create!(code: "SFO")
Airport.create!(code: "LGA")
Airport.create!(code: "YYZ")
Airport.create!(code: "DFW")

# Flights
400.times do |n|
  from_airport = rand(1..4)
  to_airport = ([*1..4] - [from_airport]).sample
  start_time = Faker::Time.forward(30, :all)
  # duration
  if (from_airport == 3 && to_airport == 2) || (from_airport == 2 && to_airport == 3)
    duration = 5400
  else
    duration = rand(10800..14400)
  end
  Flight.create!(from_airport_id: from_airport,
                 to_airport_id: to_airport,
                 start_time: start_time,
                 duration: duration)
end