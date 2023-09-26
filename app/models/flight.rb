class Flight < ApplicationRecord
  belongs_to :airline
  has_many :flight_passangers
  has_many :passangers, through: :flight_passangers

  validates :number, presence: true
  validates :date, presence: true
  validates :departure_city, presence: true
  validates :arrival_city, presence: true
end
