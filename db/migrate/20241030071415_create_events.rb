class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :subtitle
      t.string :location
      t.string :venue
      t.string :map_link
      t.integer :reviews
      t.integer :wishlists
      t.datetime :start_time
      t.string :duration
      t.string :city
      t.text :description
      t.text :highlights
      t.string :image_url
      t.string :event_type

      t.timestamps
    end
  end
end
