class UserJob < ActiveRecord::Base
  belongs_to :user
  belongs_to :job
  # belongs_to :industry
  
  validates :user_id, presence: true, numericality: {greater_than: 0}
  validates :job_id, presence: true, numericality: {greater_than: 0}
  # validates :salary, presence: true, numericality: {greater_than: 0}
  # validates :industry_id, presence: true, numericality: {greater_than: 0}
end