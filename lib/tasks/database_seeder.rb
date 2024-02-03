require 'csv'

class DatabaseSeeder
  AIRPORTS = Rails.root.join('db', 'data', 'airports.csv')
  STATE_CODES = YAML.load_file(Rails.root.join('db', 'data', 'state_codes.yml'))
  TOP50_US_AIRPORTS = YAML.load_file(Rails.root.join('db', 'data', 'top50_US_airports.yml'))

  def self.collate_airports
    airport_data = CSV.parse(File.read(AIRPORTS), headers: true)

    airports = airport_data.select do |airport|
      airport['country_id'] == 'US' && airport['code'].in?(TOP50_US_AIRPORTS['code']) && airport['city'].nil? == false
    end
    airports = airports.map do |airport|
      states = STATE_CODES.find { |state| state['Name'] == airport['state'] }
      {
        airport_code: airport['code'],
        airport_name: airport['name'],
        country_id: airport['country_id'],
        country_name: 'United States',
        city: airport['city'],
        state: states['Code'],
        county: airport['county']
      }
    end
    airports.sort_by { |airport| airport[:airport_code] }
  end
end