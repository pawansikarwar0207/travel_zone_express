class AddLogoAndImageToFlights < ActiveRecord::Migration[7.0]
  def change
    add_column :flights, :logo, :string
    add_column :flights, :image, :string
  end
end
