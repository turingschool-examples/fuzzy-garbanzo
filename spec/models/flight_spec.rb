require "rails_helper"

RSpec.describe Flight, type: :model do
  describe "relationships" do
    it { should belong_to :airline }
    it { should have_many :flight_passangers }
    it { should have_many(:passangers).through(:flight_passangers) }

    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:departure_city) }
    it { should validate_presence_of(:arrival_city) }
  end
end
