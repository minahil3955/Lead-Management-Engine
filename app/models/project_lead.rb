class ProjectLead < ApplicationRecord
  has_many :phases
  has_many :comments, as: :commentable

  belongs_to :user
  belongs_to :project, optional: true
  belongs_to :client

  validates :name, :platform, presence: true
  validates :name, :platform, length: { minimum: 3 }
  enum sale_status: %i[open close]
end
