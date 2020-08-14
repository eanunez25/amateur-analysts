class Micropost < ApplicationRecord
  belongs_to :user
  default_scop -> { order(create_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end