class Place < ApplicationRecord
	geocoded_by :address
	after_validation :geocode
	validates :name, presence: true

	belongs_to :city
	has_many :spots
end
