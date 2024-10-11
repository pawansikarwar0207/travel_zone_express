class CreateHotelServices < ActiveRecord::Migration[7.0]
  def change
    create_table :hotel_services do |t|
      t.references :hotel, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
