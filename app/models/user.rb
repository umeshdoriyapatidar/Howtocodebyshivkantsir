class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :role, inclusion: { in: %w(employer applicant), message: "%{value} is not a valid role" }, if: -> { role.present? }

  before_create :assign_default_role
  
  has_many :jobs
  has_many :job_applications

  has_many :applied_jobs, through: :job_applications

  def assign_default_role
    self.role = self.role.present? ? self.role : "applicant" 
  end

  def employer?
    role == "employer"
  end

  def applicant?
    role == "applicant"
  end
end
