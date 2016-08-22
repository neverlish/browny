class Spot < ApplicationRecord
	enum category: {do:0, see:1, eat:2, sleep:3}

	validates :name, presence: true
	validates :category, presence: true

	belongs_to :place

	has_many :posts, dependent: :destroy
	has_many :spot_reads, dependent: :destroy
	has_many :spot_rates, dependent: :destroy
	
	has_many :read_users, through: :spot_reads, source: :user
	has_many :rate_posts, through: :spot_rates, source: :post
	has_many :likes

	mount_uploader :picture, PictureUploader

	geocoded_by :address
	after_validation :geocode
end
