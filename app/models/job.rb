class Job < ActiveRecord::Base
  has_many :user_jobs
  has_many :users, :through => :user_jobs
  belongs_to :industry
  # has_many :industries, :through => :user_jobs
  
  validates :name, presence: true, format: {with: /\b[a-zA-Z]+\b/, message: "only allows letters"}
  # validates :name, presence: true, format: {with: /\A(\b[a-zA-Z]+\b)+\z/, message: "only allows letters"}
  validates :salary, presence: true, numericality: {greater_than: 0}
  validates :industry_id, presence: true, numericality: {greater_than: 0}
end