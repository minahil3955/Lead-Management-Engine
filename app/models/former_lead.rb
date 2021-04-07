class FormerLead < ApplicationRecord
  has_one :user
  has_one :project
  has_many :comments
  has_and_belongs_to_many :phases
end
