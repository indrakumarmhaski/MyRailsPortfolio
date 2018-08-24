class Workexample < ApplicationRecord
  belongs_to :user
  mount_uploader :thumbimage, ThumbimageUploader
  mount_uploader :mainimage, MainimageUploader
  has_many :technologies, dependent: :destroy, inverse_of: :workexample
  accepts_nested_attributes_for :technologies,
                                      reject_if: lambda { |attrs| attrs['topic'].blank? },
                                      allow_destroy: true
end
