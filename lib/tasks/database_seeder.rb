require 'csv'

class DatabaseSeeder
  AIRPORTS = Rails.root.join('db', 'data', 'airports.csv')
  COUNTRY_CODES = YAML.load_file(Rails.root.join('db', 'data', 'country_codes.yml'))

  def self.collate_airports
    airport_data = CSV.parse(File.read(AIRPORTS), headers: true)

    airports = airport_data.select do |airport|
      airport["country_id"] == 'US' || airport["country_id"] == 'CA'
    end.map do |airport|
      country = COUNTRY_CODES.find { |country| country['Code'].downcase == airport["country_id"].downcase }
      {
        airport_code: airport["code"],
        airport_name: airport["name"],
        country_id: airport["country_id"],
        country_name: country['Name'],
        city: airport["city"],
        state: airport["state"]
      }
    end
    airports.sort_by { |airport| airport[:airport_code] }
  end
end