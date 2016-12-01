class User < ApplicationRecord
  default_scope { where(rank: 0) }

  validates :name, :email, presence: true
  validates :email, format: { with: /\w*@\w*\.\w*/ }, uniqueness: true

  has_many :posts
  has_many :followers
  has_secure_password


end
