class CreateHotelRules < ActiveRecord::Migration[7.0]
  def change
    create_table :hotel_rules do |t|
      t.references :hotel, null: false, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
