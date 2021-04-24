# frozen_string_literal: true

class Phase < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :project_lead
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  validates :due_date, :status, :name, presence: true
  validate :due_date_in_future

  enum status: %i[active inactive], _default: :active

  after_create :send_email

  def due_date_in_future
    errors.add(:due_date, "can't be in the past") if due_date.present? && due_date < Time.zone.today
  end

  private

  def send_email
    AssigneeMailer.with(user: user, phase: self).assignment_email.deliver_later
  end
end
