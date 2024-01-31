class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  def format_date
    departure_time.strftime("%m/%d/%Y")
  end

  def format_time
    departure_time.strftime("%H:%M")
  end
end
