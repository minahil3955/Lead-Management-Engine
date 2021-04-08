class User < ApplicationRecord
  has_and_belongs_to_many :phases
  has_and_belongs_to_many :roles
  has_many :former_leads
  has_many :comments, as: :commentable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
