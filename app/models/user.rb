class User < ActiveRecord::Base
  has_many :user_jobs
  has_many :jobs, :through => :user_jobs
  has_many :accounts
  has_secure_password
  
  validates :name, presence: true, format: {with: /\A[a-zA-Z]+\b[a-zA-Z]+\z/}
  validates :email, presence: true, format: {with: /\A[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+\z/}
  validates :password, presence: true
end