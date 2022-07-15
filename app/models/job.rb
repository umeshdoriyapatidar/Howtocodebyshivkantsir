class Job < ApplicationRecord
  belongs_to :user

  has_many :job_applications
  has_many :applied_users, through: :job_applications

  validates :title, :description, :skillsets, :salary, presence: true
  validate :valid_employer?

  private

  def valid_employer?
    return errors.add(:base, "Job can be only created by employer") unless user.employer?
  end
end
