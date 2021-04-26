# frozen_string_literal: true

class ProjectLead < ApplicationRecord
  has_many :phases, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  belongs_to :user
  belongs_to :project, optional: true
  belongs_to :client

  validates :name, :platform, presence: true
  validates :name, :platform, length: { minimum: 3 }

  enum sale_status: %i[open close]
end
