class CreateViewpoints < ActiveRecord::Migration[7.0]
  def change
    create_table :viewpoints do |t|
      t.string :name
      t.text :description
      t.references :tour, null: false, foreign_key: true

      t.timestamps
    end
  end
end
