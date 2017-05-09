class Industry < ActiveRecord::Base
  has_many :user_jobs
  has_many :users, :through => :user_jobs
  has_many :jobs, :through => :user_jobs
  
  validates :name, presence: true, format: {with:/\A[a-zA-Z]+\z/}
end