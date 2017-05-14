class User < ActiveRecord::Base
  has_many :user_jobs
  has_many :jobs, :through => :user_jobs
  has_many :accounts
  has_secure_password
  
  
  #name validator requires a first AND last name
  validates :name, presence: true, format: {with: /\A\b[a-zA-Z]+\b\s\b[a-zA-Z]+\b\z/}
  
  #other validators work just as expected
  validates :email, email_format: {message: "this doesn't seem to be an email"}
  validates :password, presence: true, length: {minimum: 6}
end