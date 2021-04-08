class Comment < ApplicationRecord
  validates :comment, length: { minimum: 3 }, presence: true
  belongs_to :commentable, polymorphic: true
end
