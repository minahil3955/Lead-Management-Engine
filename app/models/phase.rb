class Phase < ApplicationRecord
  validates :due_date, :status, presence: true
  validate :due_date_in_future
  has_and_belongs_to_many :users
  has_many :project_leads
  has_many :comments, as: :commentable
  enum phase_status: %i[active inactive], _default: :active

  def due_date_in_future
    errors.add(:due_date, "can't be in the past") if due_date.present? && due_date < Date.today
  end
end
