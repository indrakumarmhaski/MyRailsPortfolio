class WorkexampleComment < ApplicationRecord
  belongs_to :user
  belongs_to :workexample
  validates :comment, presence: true
end
