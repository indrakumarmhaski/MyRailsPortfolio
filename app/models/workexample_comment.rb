class WorkexampleComment < ApplicationRecord
  belongs_to :user
  belongs_to :workexample
end
