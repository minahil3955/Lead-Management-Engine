class Comment < ApplicationRecord
  validates :body, length: { minimum: 3 }, presence: true
  belongs_to :commentable, polymorphic: true
end
