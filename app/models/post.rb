class Post < ApplicationRecord
	validates :body, presence: true

  belongs_to :user
  belongs_to :spot
  has_one :spot_rate
  has_many :likes, dependent: :destroy

  has_many :liked_users, through: :likes, source: :user

  mount_uploader :picture, PictureUploader
end
