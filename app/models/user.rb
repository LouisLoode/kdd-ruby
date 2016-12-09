class User < ApplicationRecord

  searchkick autocomplete: [:name, :email]


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

  has_many :posts, dependent: :destroy

  has_many :rates, dependent: :destroy

  has_many :favorites, dependent: :destroy

  has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

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

  # Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

  def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = :user_id"
    Post.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
  end

end
