require "rails_helper"

RSpec.describe "the flights index page" do
  it "displays all flights, their airlines, and their associated passengers" do
    southwest = Airline.create!(name: "Southwest")
    lufthansa = Airline.create!(name: "Lufthansa")

    flight_1 = Flight.create(number: "123", date: "08/03/20", departure_city: "San Jose", arrival_city: "Denver", airline: southwest)
    flight_2 = Flight.create(number: "456", date: "08/04/20", departure_city: "Denver", arrival_city: "Berlin", airline: lufthansa)

    alfred = Passenger.create(name: "Alfred", age: 23)
    bert = Passenger.create(name: "Bert", age: 33)
    carol = Passenger.create(name: "Carol", age: 42)
    dean = Passenger.create(name: "Dean", age: 53)
    eve = Passenger.create(name: "Eve", age: 63)

    FlightPassenger.create(flight: flight_1, passenger: alfred)
    FlightPassenger.create(flight: flight_1, passenger: bert)
    FlightPassenger.create(flight: flight_1, passenger: carol)
    FlightPassenger.create(flight: flight_1, passenger: dean)
    FlightPassenger.create(flight: flight_1, passenger: eve)
    FlightPassenger.create(flight: flight_2, passenger: alfred)
    FlightPassenger.create(flight: flight_2, passenger: eve)

    visit "/flights"

    expect(page).to have_content(flight_1.number)
    expect(page).to have_content(flight_2.number)

    expect(page).to have_content(southwest.name)
    expect(page).to have_content(lufthansa.name)

    expect(page).to have_content(alfred.name, :count => 2)
    expect(page).to have_content(bert.name)
    expect(page).to have_content(carol.name)
    expect(page).to have_content(dean.name)
    expect(page).to have_content(eve.name, :count => 2)
  end 

  it "has a link to remove a passneger from a flight" do
    southwest = Airline.create!(name: "Southwest")
    lufthansa = Airline.create!(name: "Lufthansa")

    flight_1 = Flight.create(number: "123", date: "08/03/20", departure_city: "San Jose", arrival_city: "Denver", airline: southwest)
    flight_2 = Flight.create(number: "456", date: "08/04/20", departure_city: "Denver", arrival_city: "Berlin", airline: lufthansa)

    alfred = Passenger.create(name: "Alfred", age: 23)
    bert = Passenger.create(name: "Bert", age: 33)
    carol = Passenger.create(name: "Carol", age: 42)
    dean = Passenger.create(name: "Dean", age: 53)
    eve = Passenger.create(name: "Eve", age: 63)

    FlightPassenger.create(flight: flight_1, passenger: alfred)
    FlightPassenger.create(flight: flight_1, passenger: bert)
    FlightPassenger.create(flight: flight_1, passenger: carol)
    FlightPassenger.create(flight: flight_1, passenger: dean)
    FlightPassenger.create(flight: flight_1, passenger: eve)
    FlightPassenger.create(flight: flight_2, passenger: alfred)
    FlightPassenger.create(flight: flight_2, passenger: eve)

    visit "/flights"

    expect(page).to have_button("Remove Passenger", :count => 7)
  end

end

# User Story 2, Remove a Passenger from a Flight

# As a visitor
# When I visit the flights index page
# Next to each passengers name
# I see a link or button to remove that passenger from that flight
# When I click on that link/button
# I'm returned to the flights index page
# And I no longer see that passenger listed under that flight,
# And I still see the passenger listed under the other flights they were assigned to.