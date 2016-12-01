class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  default_scope { where(rank: 0) }

  # validates :name, :email, presence: true
  validates :email, format: { with: /\w*@\w*\.\w*/ }, uniqueness: true, presence: true

  has_many :posts
  has_many :followers

end
