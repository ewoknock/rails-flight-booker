class PassengerMailer < ApplicationMailer
  def confirmation_email
    @booking = params[:booking]
    @url = booking_url(@booking)
    mail(to: @booking.passengers.pluck(:email), 
          subject: "Thank you for booking Flight #{@booking.flight_id}!")
  end
end
