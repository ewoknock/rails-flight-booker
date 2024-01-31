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
  Airport.destroy_all
  airports.each do |airport|
    Airport.create(
      code: airport[:airport_code],
      name: airport[:airport_name],
      country_id: airport[:country_id],
      country: airport[:country_name],
      city: airport[:city],
      state: airport[:state]
    )
  end
end

seed_airports(DatabaseSeeder.collate_airports)
