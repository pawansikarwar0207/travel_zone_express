class AddImagesToHotels < ActiveRecord::Migration[7.0]
  def change
    add_column :hotels, :images, :string
  end
end
