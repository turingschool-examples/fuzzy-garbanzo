class Passanger < ApplicationRecord
  has_many :flight_passangers
  has_many :flights, through: :flight_passangers

  validates :name, presence: true
  validates :age, presence: true
end
