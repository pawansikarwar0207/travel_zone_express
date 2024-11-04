class CreateBoats < ActiveRecord::Migration[7.0]
  def change
    create_table :boats do |t|
      t.string :name
      t.decimal :rating
      t.integer :reviews_count
      t.integer :passengers
      t.integer :crew
      t.decimal :price
      t.text :description
      t.string :manufacturer
      t.string :model
      t.integer :year
      t.string :engines
      t.string :fuel

      t.timestamps
    end
  end
end
