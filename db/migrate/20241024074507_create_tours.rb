class CreateTours < ActiveRecord::Migration[7.0]
  def change
    create_table :tours do |t|
      t.string :name
      t.text :description
      t.string :hours
      t.string :image
      t.decimal :average_rating

      t.timestamps
    end
  end
end
