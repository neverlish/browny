class Post < ApplicationRecord
	validates :body, presence: true

  belongs_to :user
  belongs_to :spot
  has_one :spot_rate
  has_many :likes
  mount_uploader :picture, CkeditorPictureUploader
  serialize :imageurls, Array
end
