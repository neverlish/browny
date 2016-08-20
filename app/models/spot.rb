class Spot < ApplicationRecord
	validates :name, presence: true
	validates :category, presence: true

	belongs_to :place

	has_many :posts, dependent: :destroy
	# has_many :asks, dependent: :destroy
	has_many :spot_reads, dependent: :destroy
	has_many :spot_rates, dependent: :destroy

	has_many :read_users, through: :spot_reads, source: :user
	# has_many :asked_users, through: :asks, source: :user
	has_many :rate_posts, through: :spot_rates, source: :post
end
