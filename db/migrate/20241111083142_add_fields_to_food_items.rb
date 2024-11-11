class AddFieldsToFoodItems < ActiveRecord::Migration[7.0]
  def change
    add_column :food_items, :photo, :string
  end
end
