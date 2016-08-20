class Place < ApplicationRecord
	validates :name, presence: true

	belongs_to :city

	has_many :spots
end
