class Place < ApplicationRecord
	geocoded_by :address
	after_validation :geocode

	validates :name, presence: true
	
	belongs_to :city
	has_many :spots

	mount_uploader :picture, PictureUploader

	def json_data
		{ type: "Place", name: name, children: spots.map{|spot| spot.json_data}, id: id } 
	end
end
