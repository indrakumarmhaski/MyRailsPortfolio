class Blog < ApplicationRecord
  belongs_to :user
  mount_uploader :blogimage, BlogimageUploader
end
