require "rails_helper"

RSpec.describe FlightPassanger, type: :model do
  describe "relationships" do
    it { should belong_to :flight }
    it { should belong_to :passanger }
  end
end
