class Client < ApplicationRecord
  has_many :project_leads

  validates :name, :email, :address, :contact, presence: true
  validates :name, :email, :address, :contact, length: { minimum: 3 }

  accepts_nested_attributes_for :project_leads, allow_destroy: true
end
