class Workexample < ApplicationRecord
  belongs_to :user
  mount_uploader :thumbimage, ThumbimageUploader
end
