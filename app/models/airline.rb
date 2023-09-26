class Airline < ApplicationRecord
  has_many :flights

  validates :name, presence: true

  def self.adults_only
    flight.passangers.where("passangers.age >= 18").distinct
  end
end
