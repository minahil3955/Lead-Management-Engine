class Project < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  has_many :project_leads
end
