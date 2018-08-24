class Workexample < ApplicationRecord
  belongs_to :user
  mount_uploader :thumbimage, ThumbimageUploader
  mount_uploader :mainimage, MainimageUploader
  has_many :technologies, dependent: :destroy
end
