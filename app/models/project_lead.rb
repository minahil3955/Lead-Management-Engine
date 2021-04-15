class ProjectLead < ApplicationRecord
  validates :name, :platform, presence: true
  validates :name, :platform, length: { minimum: 3 }
  belongs_to :user
  belongs_to :project, optional: true
  belongs_to :client
  has_many :phases
  has_many :comments, as: :commentable
  enum is_sale: %i[open close], _default: :open
end
