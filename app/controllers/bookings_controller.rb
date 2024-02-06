class BookingsController < ApplicationController

  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new(flight_id: @flight_id)
    params[:no_of_passengers].to_i.times { @booking.passengers.build }
  end
end
