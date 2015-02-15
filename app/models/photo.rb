class Photo < ActiveRecord::Base
	belongs_to :user
	belongs_to :space

	mount_uploader :picture, PictureUploader
end
