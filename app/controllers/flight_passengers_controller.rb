class FlightPassengersContoller < ApplicationController
  def destroy
    flight = Flight.find(params[:id])

    FlightPassenger.find_by(flight_id: params[:id], passenger_id: params[:passenger_id]).destroy