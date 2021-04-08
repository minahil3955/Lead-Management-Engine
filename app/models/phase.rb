class Phase < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :former_lead
  has_many :comments, as: :commentable
  enum phase_status: %i[active inactive], _default: :active
end
