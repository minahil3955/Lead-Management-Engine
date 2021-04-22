class Project < ApplicationRecord
  has_many :project_leads

  validates :name, presence: true, length: { minimum: 3 }
end
