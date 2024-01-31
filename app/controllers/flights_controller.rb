class FlightsController < ApplicationController
  def index
    @departure_airports = Airport.all.map{ |airport| airport.code }
    @arrival_airports = Airport.all.map{ |airport| airport.code }
  end
end
