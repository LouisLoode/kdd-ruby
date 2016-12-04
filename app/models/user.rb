class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable
  default_scope { where(rank: 0) }

  # validates :name, presence: true
  # validates :email, uniqueness: true, presence: true # @TODO REGEX

  has_many :posts
  has_many :followers

end
