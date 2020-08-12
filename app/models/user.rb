class User < ApplicationRecord
  USERNAME_REGEX = /\A^[a-zA-Z0-9](_(?!(\.|_))|\.(?!(_|\.))|[a-zA-Z0-9]){6,18}[a-zA-Z0-9]$\z/
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 5, maximum: 12 }, format: { with: USERNAME_REGEX }

  has_many :prices
  has_many :equities, through: :prices
end