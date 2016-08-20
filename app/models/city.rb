class City < ApplicationRecord
	geocoded_by :address
	after_validation :geocode
	validates :name, presence: true
	has_many :places
end
