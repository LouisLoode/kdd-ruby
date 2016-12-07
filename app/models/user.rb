class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable
  default_scope { where(rank: 0) }

  validates :name, uniqueness: true, presence: true, length: { minimum: 3, maximum: 17 }
  validates :email, uniqueness: true, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :github, uniqueness: true, format: { with: /\Ahttps:\/\/github.com\// }, allow_blank: true
  validates :website, format: { with: /\A(http|https):\/\// }, allow_blank: true
  validates :biography, length: { maximum: 250 }, allow_blank: true
  validates :avatar, format: { with: %r{\Ahttps?://.+\.(?:jpe?g|png)\z}i }, allow_blank: true

  has_many :posts
  has_many :followers
  has_many :rates

  # def already_ranks?(post)
  #   puts self.ranks.find(:all, :conditions => ['post_id = ?', post.id]).size > 0
  #   self.ranks.find(:all, :conditions => ['post_id = ?', post.id]).size > 0
  # end

#   has_many :posts, through: :ranks

  before_create :slugify_name
  before_update :slugify_name

  def slugify_name
    if name
       self.slug = self.name.parameterize
    end
  end
end
