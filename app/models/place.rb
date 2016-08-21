class Place < ApplicationRecord
	geocoded_by :address
	after_validation :geocode
	validates :name, presence: true

	belongs_to :city
	mount_uploader :picture, PictureUploader
	has_many :spots
end
