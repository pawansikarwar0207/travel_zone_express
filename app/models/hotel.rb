class Hotel < ApplicationRecord
	# mount_uploaders :images, ImageUploader

	has_many_attached :images
	has_many :rooms, dependent: :destroy
  has_many :facilities, dependent: :destroy
  has_many :hotel_services, dependent: :destroy
  has_many :hotel_rules, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :hotel_name, :address, :contact_number, :description, :price_per_night, :property_type, :highlights, presence: true

  PROPERTY_TYPE = [
    'Apartments',
    'Hotels',
    'Homestays',
    'Villas',
    'Boats',
    'Motels',
    'Lodges',
    'Holiday homes',
    'Cruises'
  ]

end
