class Price < ApplicationRecord
  validates :buyprice, presence: true, numericality: { greater_than: 0 }
  validates :equity_id, presence: true
  validates :user_id, presence: true

  belongs_to :equity
  belongs_to :user
end
