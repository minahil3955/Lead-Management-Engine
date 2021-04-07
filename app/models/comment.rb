class Comment < ApplicationRecord
  belongs_to :former_lead
  belongs_to :user
end
