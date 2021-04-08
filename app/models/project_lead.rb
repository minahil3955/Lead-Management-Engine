class ProjectLead < ApplicationRecord
  validates :name, :platform, presence: true
  validates :name, :platform, length: { minimum: 3 }
  belongs_to :user
  belongs_to :phase
  belongs_to :project
  belongs_to :client
  has_many :comments, as: :commentable
  enum is_sale: %i[open close], _default: :close
end
