class Post < ApplicationRecord
  belongs_to :user
  has_many :ranks
  has_one :category
  validates :url, presence: true,
                    length: { minimum: 5 }
  validates :message,
                    length: { maximum: 250 }
  validates :user_id, presence: true
  # validates :cat_id, presence: true
end
