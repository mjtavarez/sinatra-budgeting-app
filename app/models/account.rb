class Account < ActiveRecord::Base
  belongs_to :user
  
  validates :name, presence: true, format: {with: /\A[a-zA-Z]+\z/, message: "only allows letters"}
  validates :due_date, presence: true, numericality: {greater_than: 0}, length: {maximum: 2}
  validates :interest, presence: true, numericality: {less_than_or_equal_to: 100}
  validates :balance, presence: true, numericality: {greater_than_or_equal_to: 0}
end