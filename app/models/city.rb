class City < ApplicationRecord
	geocoded_by :address
	after_validation :geocode

	validates :name, presence: true

	has_many :places
	
	mount_uploader :picture, PictureUploader

	def json_data
		{ type: "City", name: name, children: places.map{|place| place.json_data}, id: id } 
	end
end
