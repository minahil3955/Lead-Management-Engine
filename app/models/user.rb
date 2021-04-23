class User < ApplicationRecord
  has_and_belongs_to_many :phases
  has_and_belongs_to_many :roles
  has_many :project_leads, dependent: :destroy
  has_many :comments, as: :commentable

  validates :roles, length: { minimum: 1 }
  validates :roles, length: { maximum: 3 }
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  accepts_nested_attributes_for :roles, allow_destroy: true

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
end

