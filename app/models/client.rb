class Client < ApplicationRecord
  validates :name, :email, :address, :contact, presence: true
  validates :name, :email, :address, :contact, length: { minimum: 3 }
  has_many :project_leads
end
