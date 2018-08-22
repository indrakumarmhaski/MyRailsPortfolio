class Blog < ApplicationRecord
  belongs_to :user
  mount_uploader :blogimage, BlogimageUploader
  has_many :tags, dependent: :destroy, inverse_of: :blog
  has_many :likes, dependent: :destroy
  has_many :blog_comments, dependent: :destroy      
  accepts_nested_attributes_for :tags,
                                      reject_if: lambda { |attrs| attrs['topic'].blank? },
                                      allow_destroy: true
end
