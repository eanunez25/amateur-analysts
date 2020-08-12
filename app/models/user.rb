class User < ApplicationRecord
  before_save { self.email = email.downcase }
  USERNAME_REGEX = /\A^[a-zA-Z0-9](_(?!(\.|_))|\.(?!(_|\.))|[a-zA-Z0-9]){6,18}[a-zA-Z0-9]$\z/i
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 5, maximum: 12 }, format: { with: USERNAME_REGEX }
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, length: { maximum: 30 }, format: { with: EMAIL_REGEX }

  has_many :prices
  has_many :equities, through: :prices
end