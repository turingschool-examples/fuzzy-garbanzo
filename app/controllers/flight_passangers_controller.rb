class FlightPassangersController < ApplicationController
  def destroy
    @flight_passanger = FlightPassanger.find_by(flight: params[:flight_id], passanger: params[:passanger_id])
    @flight_passanger.destroy

    redirect_to flights_path
  end
end
