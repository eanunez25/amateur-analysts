class Equity < ApplicationRecord
  validates :ticker, presence: true, length: { maximum: 4 }, format: { with: /\A[A-Z]+\z/, message: "only allows capital letters" }

  has_many: prices
  has_many: users, through: :prices
end
