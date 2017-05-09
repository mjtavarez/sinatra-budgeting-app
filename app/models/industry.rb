class Industry < ActiveRecord::Base
  has_many :user_jobs
  has_many :users, :through => :user_jobs
  has_many :jobs, :through => :user_jobs
  
  
end