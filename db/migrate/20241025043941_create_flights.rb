class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.string :flight_number
      t.string :departure_location
      t.string :arrival_location
      t.datetime :take_off_time
      t.datetime :landing_time
      t.string :seat_type
      t.string :baggage_checkin
      t.string :baggage_cabin
      t.decimal :price
      t.integer :number_of_seats

      t.timestamps
    end
  end
end
