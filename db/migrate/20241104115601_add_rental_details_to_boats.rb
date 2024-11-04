class AddRentalDetailsToBoats < ActiveRecord::Migration[7.0]
  def change
    add_column :boats, :available, :boolean
    add_column :boats, :rental_price, :decimal
  end
end
