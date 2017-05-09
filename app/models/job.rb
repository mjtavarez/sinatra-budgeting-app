class Job < ActiveRecord::Base
  has_many :user_jobs
  has_many :users, :through => :user_jobs
  belongs_to :industry
  
  validates :name, presence: true, format: {with: /\A[a-zA-Z]+\z/, message: "only allows letters"}
  validates :salary, presence: true, numericality: {greater_than: 0}
  validates :industry_id, presence: true, numericality: {greater_than: 0}
end