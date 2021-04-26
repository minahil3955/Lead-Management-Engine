# frozen_string_literal: true

class Role < ApplicationRecord
  has_and_belongs_to_many :users

  validates :name, presence: true

  enum name: %i[Business_Developer Engineer Technical_Manager]
end
