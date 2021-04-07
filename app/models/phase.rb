class Phase < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :former_leads
end
