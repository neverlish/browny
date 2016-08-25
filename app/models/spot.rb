class Spot < ApplicationRecord
	enum category: {do:0, see:1, eat:2, sleep:3}

	validates :name, presence: true
	validates :category, presence: true

	belongs_to :user
	belongs_to :place

	has_many :posts, dependent: :destroy
	has_many :likes, dependent: :destroy

	has_many :spot_reads, dependent: :destroy
	has_many :spot_rates, dependent: :destroy
	
	has_many :liked_users, through: :likes, source: :user
	has_many :read_users, through: :spot_reads, source: :user
	has_many :rate_posts, through: :spot_rates, source: :post
	
	mount_uploader :picture, PictureUploader

	geocoded_by :address
	after_validation :geocode

	def json_data
		{ type: "Spot", name: name, children: nil, id: id } 
	end
end
