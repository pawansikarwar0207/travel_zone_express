class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :category
      t.decimal :total_price

      t.timestamps
    end
  end
end
