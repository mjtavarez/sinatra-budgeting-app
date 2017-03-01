class Industry
  has_many :user_jobs
  has_many :users, :through => :user_jobs
  has_many :jobs
end