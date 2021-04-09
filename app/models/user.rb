class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  has_and_belongs_to_many :phases
  has_and_belongs_to_many :roles
  has_many :project_leads
  has_many :comments, as: :commentable
  accepts_nested_attributes_for :roles, allow_destroy: true

  validates_associated :roles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
