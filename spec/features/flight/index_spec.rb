require "rails_helper"

RSpec.describe "Flight Index" do
  before :each do
    @airline_1 = Airline.create!(name: "Scuderia Ferrari")

    @flight_1 = Flight.create!(number: "12345", date: "9/26/23", departure_city: "Tokyo", arrival_city: "Medellin", airline_id: @airline_1.id)
    @flight_2 = Flight.create!(number: "67890", date: "10/27/24", departure_city: "Madrid", arrival_city: "Seoul", airline_id: @airline_1.id)

    @passanger_1 = Passanger.create!(name: "Yuji", age: 21)
    @passanger_2 = Passanger.create!(name: "Megumi", age: 28)
    @passanger_3 = Passanger.create!(name: "Gojo", age: 35)

    FlightPassanger.create!(flight: @flight_1, passanger: @passanger_1)
    FlightPassanger.create!(flight: @flight_1, passanger: @passanger_2)
    FlightPassanger.create!(flight: @flight_2, passanger: @passanger_2)
    FlightPassanger.create!(flight: @flight_2, passanger: @passanger_3)

    visit flights_path
  end

  describe "US 1 - Flight Index Page" do
    describe "Flight index page shows my all flight numbers" do
      it "Next to each flight number I see the name of the Airline of that flight and under each flight number I see the names of all that flight's passengers" do
        expect(page).to have_content(@flight_1.number)
        expect(page).to have_content(@airline_1.name)
        expect(page).to have_content(@passanger_1.name)
        expect(page).to have_content(@passanger_2.name)

        expect(page).to have_content(@flight_2.number)
        expect(page).to have_content(@airline_1.name)
        expect(page).to have_content(@passanger_2.name)
        expect(page).to have_content(@passanger_3.name)
      end
    end
  end

  describe "US 2 - Remove a Passanger" do
    describe "I see remove buttons next to each passanger and When I click that button to remove one passanger from that flight" do
      describe " I'm brought back to the flight's index page and I no longer see that passanger's name listed under that flight" do
        it "I see that the passanger is still on the other flight's they are assigned too" do
          expect(page).to have_content(@passanger_1.name)
          expect(page).to have_content(@passanger_2.name)
          expect(page).to have_content(@passanger_3.name)

          expect(page).to have_button("Remove Passanger")

          click_button "Remove Passanger Megumi Flight 67890"

          expect(current_path).to eq(flights_path)

          expect(page).to have_content(@passanger_1.name)
          expect(page).not_to have_content("Megumi Flight 67890")
          expect(page).to have_content(@passanger_3.name)
        end
      end
    end
  end
end
