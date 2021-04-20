class User < ApplicationRecord
  devise :registerable, :confirmable
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  has_and_belongs_to_many :phases
  has_and_belongs_to_many :roles
  has_many :project_leads, dependent: :destroy
  has_many :comments, as: :commentable
  accepts_nested_attributes_for :roles, allow_destroy: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
end
