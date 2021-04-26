# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  validates :body, length: { minimum: 3 }, presence: true
end
