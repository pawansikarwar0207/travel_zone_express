class CreateHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :hotels do |t|
      t.string :hotel_name
      t.text :description
      t.string :address
      t.string :facilities
      t.string :hotel_services
      t.string :contact_number
      t.string :price_per_night

      t.timestamps
    end
  end
end
