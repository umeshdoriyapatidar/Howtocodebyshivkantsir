class JobApplication < ApplicationRecord
  belongs_to :applied_users, class_name: "User", foreign_key: "user_id"
  belongs_to :applied_jobs, class_name: "Job", foreign_key: "job_id"

  validate :valid_applicant?

  private

  def valid_applicant?
    return errors.add(:base, "Job application can be only submitted by applicant") unless user.applicant?
  end
end
