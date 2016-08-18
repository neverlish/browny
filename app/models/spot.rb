class Spot < ApplicationRecord
	has_many :posts
	has_many :rated_posts, through: :spot_rates, source: :post
	has_many :said_users, through: :sayings, source: :user
end
