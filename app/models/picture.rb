class Picture < ApplicationRecord
	mount_uploader :imageable_type, pictureUploader
	belongs_to :imageable, polymorphic: true
end
