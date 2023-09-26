class CreateFlightPassangers < ActiveRecord::Migration[7.0]
  def change
    create_table :flight_passangers do |t|
      t.references :flight, null: false, foreign_key: true
      t.references :passanger, null: false, foreign_key: true

      t.timestamps
    end
  end
end
