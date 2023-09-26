require 'rails_helper'

RSpec.describe Passenger, type: :model do
  it { should have_many :flights}

  describe "#self" do
    it "can list out all unique adults" do
      alfred = Passenger.create(name: "Alfred", age: 3)
      bert = Passenger.create(name: "Bert", age: 13)
      carol = Passenger.create(name: "Carol", age: 42)
      dean = Passenger.create(name: "Dean", age: 53)
      eve = Passenger.create(name: "Eve", age: 63)

      expected_array = Passenger.adults.sort

      expect(expected_array).to eq([carol, dean, eve])
    end
  end
end
