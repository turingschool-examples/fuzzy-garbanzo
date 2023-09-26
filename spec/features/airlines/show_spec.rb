require "rails_helper"

RSpec.describe "the airline show page" do
  it "show all adults that have flights on the airline" do
    southwest = Airline.create!(name: "Southwest")
    lufthansa = Airline.create!(name: "Lufthansa")

    flight_1 = Flight.create(number: "123", date: "08/03/20", departure_city: "San Jose", arrival_city: "Denver", airline: southwest)
    flight_2 = Flight.create(number: "456", date: "08/04/20", departure_city: "Denver", arrival_city: "Berlin", airline: lufthansa)
    flight_3 = Flight.create(number: "153", date: "08/13/20", departure_city: "San Jose", arrival_city: "New York City", airline: southwest)

    alfred = Passenger.create(name: "Alfred", age: 3)
    bert = Passenger.create(name: "Bert", age: 13)
    carol = Passenger.create(name: "Carol", age: 42)
    dean = Passenger.create(name: "Dean", age: 53)
    eve = Passenger.create(name: "Eve", age: 63)

    FlightPassenger.create(flight: flight_1, passenger: alfred)
    FlightPassenger.create(flight: flight_1, passenger: bert)
    FlightPassenger.create(flight: flight_1, passenger: carol)
    FlightPassenger.create(flight: flight_1, passenger: dean)
    FlightPassenger.create(flight: flight_2, passenger: eve)
    FlightPassenger.create(flight: flight_3, passenger: carol)

    visit "/airlines/#{southwest.id}"
    
    save_and_open_page

    expect(page).to have_content(carol.name, :count => 1)
    expect(page).to have_content(dean.name, :count => 1)
  end
end