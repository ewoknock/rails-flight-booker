class FlightsController < ApplicationController

  helper_method :search_submitted?

  def index
    @departure_airports = Airport.all.map{ |airport| airport.code }
    @arrival_airports = Airport.all.map{ |airport| airport.code }

    if search_submitted?
      puts "here"
      @flights = Flight.where(
        departure_airport_id: params[:departure_airport_id],
        arrival_airport_id: params[:arrival_airport_id]).where(
          "departure_time > ?", params[:departure_date]
        )
        puts "hi"
        puts @flights.count

    end

  end


  def search_submitted?
    puts params
    params[:departure_airport_id] && params[:arrival_airport_id] && params[:departure_date] && params[:num_passengers]
  end
end
