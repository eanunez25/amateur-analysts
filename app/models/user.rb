class User < ApplicationRecord
  attr_accessor :remember_token
  before_save { self.email = email.downcase }
  USERNAME_REGEX = /\A^[a-zA-Z0-9](_(?!(\.|_))|\.(?!(_|\.))|[a-zA-Z0-9]){6,18}[a-zA-Z0-9]$\z/i
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 5, maximum: 12 }, format: { with: USERNAME_REGEX }
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, length: { maximum: 30 }, format: { with: EMAIL_REGEX }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  has_many :prices
  has_many :equities, through: :prices

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
          BCrypt::Engine.cost
          BCrypt::Password.create(string, cost: cost)
  end

  # returns a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # remembers a user in the db for use in persistent sessions
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # returns true if the given token matches the digest
  def authenticated?(remember_token)
    return fals if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # forgets a user
  def forget
    update_attribute(:remember_digest, nil)
  end

end