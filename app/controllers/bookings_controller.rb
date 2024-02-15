class BookingsController < ApplicationController

  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new(flight_id: @flight_id)
    params[:no_of_passengers].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      PassengerMailer.with(booking: @booking).confirmation_email.deliver_later
      redirect_to booking_path(@booking.id)
    else
      @flight = Flight.find(params[:booking][:flight_id])
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = Flight.find(@booking.flight_id)
  end

  private

  def booking_params
    params.require(:booking).permit(:no_of_passengers, :flight_id, passengers_attributes: [:id, :name, :email])
  end
end
