class PassengerMailer < ApplicationMailer

  def thank_you(passenger)
    @passenger = passenger
    @url = "http://localhost:3000/bookings/#{@passenger.bookings.last.id}"
    mail(to: @passenger.email, subject: "Thank you for your booking!")
  end
end
