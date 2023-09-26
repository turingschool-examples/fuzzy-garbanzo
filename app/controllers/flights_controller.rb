class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @passangers = Passanger.all
  end
end
