class Price < ApplicationRecord
  validates :buyprice, presence: true, numericality: { greater_than: 0 }

  belongs_to :equity
  belongs_to :user
end
