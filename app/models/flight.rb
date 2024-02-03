class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  def format_date
    departure_time.strftime("%m/%d/%Y")
  end

  def format_time
    departure_time.strftime("%H:%M")
  end

  def arrival_time
    (departure_time + flight_duration).strftime("%H:%M")
  end

  def format_duration
    Time.at(flight_duration).utc.strftime("%Hh %Mm")
  end
end
