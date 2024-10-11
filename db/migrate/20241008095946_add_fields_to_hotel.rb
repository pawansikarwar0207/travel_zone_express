class AddFieldsToHotel < ActiveRecord::Migration[7.0]
  def change
    remove_column :hotels, :facilities, :string
    remove_column :hotels, :hotel_services, :string
    add_column :hotels, :property_type, :string
    add_column :hotels, :highlights, :text
  end
end
