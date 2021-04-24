# frozen_string_literal: true

class User < ApplicationRecord
  has_and_belongs_to_many :phases
  has_and_belongs_to_many :roles
  has_many :project_leads, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  validates :roles, length: { minimum: 1 }
  validates :roles, length: { maximum: 3 }
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  accepts_nested_attributes_for :roles, allow_destroy: true

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  scope :role_manager, -> { joins(:roles).where('roles.name =? ', 2) }
  scope :role_engineer, -> { joins(:roles).where('roles.name =? ', 1) }

  def business_developer?
    roles.pluck(:name).include?('Business_Developer')
  end
end
