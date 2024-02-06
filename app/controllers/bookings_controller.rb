class BookingsController < ApplicationController

  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new(flight_id: @flight_id, no_of_passengers: params[:no_of_passengers])
  end
end
