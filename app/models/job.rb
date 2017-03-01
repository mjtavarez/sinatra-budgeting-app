class Job
  has_many :user_jobs
  has_many :users, :through => :user_jobs
  belongs_to :industry
end