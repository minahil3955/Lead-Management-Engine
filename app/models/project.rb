# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :project_leads, dependent: :destroy

  validates :name, presence: true
  validates :name, length: { minimum: 3 }
end
