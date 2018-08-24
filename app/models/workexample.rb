class Workexample < ApplicationRecord
  belongs_to :user
  mount_uploader :thumbimage, ThumbimageUploader
  mount_uploader :mainimage, MainimageUploader
end
