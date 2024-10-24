class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :brand
      t.string :model
      t.decimal :price_per_day
      t.boolean :available

      t.timestamps
    end
  end
end
