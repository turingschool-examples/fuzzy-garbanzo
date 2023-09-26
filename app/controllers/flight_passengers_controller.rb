class FlightPassengersController < ApplicationController
  def destroy
    flight= Flight.find(params[:flight_id])
    passenger = Passenger.find(params[:id])

    FlightPassenger.find_by(flight_id: flight, passenger_id: passenger).destroy

    redirect_to "/flights"
  end
end