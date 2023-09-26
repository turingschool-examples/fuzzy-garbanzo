class Passanger < ApplicationRecord
  has_many :flight_passangers
  has_many :flights, through: :flight_passangers
end
