require "rails_helper"

RSpec.describe "Airline Show" do
  before :each do
    @airline_1 = Airline.create!(name: "Scuderia Ferrari")

    @flight_1 = Flight.create!(number: "12345", date: "9/26/23", departure_city: "Tokyo", arrival_city: "Medellin", airline_id: @airline_1.id)
    @flight_2 = Flight.create!(number: "67890", date: "10/27/24", departure_city: "Madrid", arrival_city: "Seoul", airline_id: @airline_1.id)

    @passanger_1 = Passanger.create!(name: "Maki", age: 7)
    @passanger_2 = Passanger.create!(name: "Yuji", age: 14)
    @passanger_3 = Passanger.create!(name: "Megumi", age: 21)
    @passanger_4 = Passanger.create!(name: "Gojo", age: 28)

    FlightPassanger.create!(flight: @flight_1, passanger: @passanger_1)
    FlightPassanger.create!(flight: @flight_1, passanger: @passanger_3)
    FlightPassanger.create!(flight: @flight_2, passanger: @passanger_2)
    FlightPassanger.create!(flight: @flight_2, passanger: @passanger_4)

    visit airline_path(@airline_1)
  end

  describe "US 3 - Airline Show Page" do
    describe "Airline Show page shows me all passengers flying that airline" do
      it "The list is unique and is only adult passengers (Age is 18 or older)" do
        save_and_open_page
        expect(page).to have_content(@airline_1.name)

        expect(page).not_to have_content(@passanger_1.name)
        expect(page).not_to have_content(@passanger_2.name)

        expect(page).to have_content(@passanger_3.name)
        expect(page).to have_content(@passanger_4.name)
      end
    end
  end
end
