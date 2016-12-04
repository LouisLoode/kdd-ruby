class Post < ApplicationRecord
  belongs_to :user
  has_many :ranks
  has_one :cat
  validates :url, presence: true,
                    length: { minimum: 5 }
  validates :message,
                    length: { maximum: 250 }
  validates :user_id, presence: true
  # validates :cat_id, presence: true
end
