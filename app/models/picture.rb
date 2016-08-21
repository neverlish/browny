class Picture < ApplicationRecord
	mount_uploader :picture, pictureUploader
	belongs_to :imageable, polymorphic: true
end
