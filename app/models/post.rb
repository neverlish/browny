class Post < ApplicationRecord
	validates :body, presence: true

	belongs_to :user
	belongs_to :spot

	has_one :spot_rate
	has_many :likes, dependent: :destroy
	has_many :liked_users, through: :likes, source: :user

	serialize :imageurls, Array

	mount_uploader :picture, CkeditorPictureUploader

	before_save do
		if body.present?
			self.imageurls = Nokogiri::HTML.fragment(body).css('img').map{|img| img.attribute('src')}.collect(&:to_s)
		end
	end
end
