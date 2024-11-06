class AddPhotoUrlToFoodItems < ActiveRecord::Migration[7.0]
  def change
    add_column :food_items, :photo_url, :string
  end
end
