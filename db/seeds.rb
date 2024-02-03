require './lib/tasks/database_seeder'
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

def seed_airports(airports)
  Airport.delete_all
  airports.each do |airport|
    Airport.create(
      code: airport[:airport_code],
      name: airport[:airport_name],
      country_id: airport[:country_id],
      country: airport[:country_name],
      city: airport[:city],
      state: airport[:state],
      county: airport[:county]
    )
  end
end

def seed_flights
  Flight.delete_all
  5000.times do
    airport_ids = (Airport.first.id..Airport.last.id).to_a.shuffle.take(2)
    departure_time = DateTime.now + rand(1..10080).minutes
    f = Flight.create(
      departure_airport_id: airport_ids[0],
      arrival_airport_id: airport_ids[1],
      departure_time: departure_time,
      flight_duration: rand(3600..18000).seconds
    )
  end
end

seed_airports(DatabaseSeeder.collate_airports)
seed_flights
