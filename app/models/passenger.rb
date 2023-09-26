class Passenger < ApplicationRecord
  has_many :flight_passengers
  has_many :flights, through: :flight_passengers
  
  def self.adults
    where("age > 17").distinct
  end
end
