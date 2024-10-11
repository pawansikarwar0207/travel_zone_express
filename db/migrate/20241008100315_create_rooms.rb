class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.references :hotel, null: false, foreign_key: true
      t.string :room_type
      t.decimal :price_per_night
      t.text :description

      t.timestamps
    end
  end
end
