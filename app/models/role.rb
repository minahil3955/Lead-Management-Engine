class Role < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  enum name: %i[Business_Developer Engineer Technical_Manager]
  has_and_belongs_to_many :users
  enum name: %i[Business_Developer Engineer Technical_Manager]
end
